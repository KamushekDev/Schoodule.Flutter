param([string]$apiHost = 'https://localhost:5001')

$outputDir = '.\apiClient'
$location = (Get-Location);

# Удаляем старые файлы если папка существует
if (Test-Path $outputDir)
{
    Get-ChildItem -Path $outputDir -Include * -File -Recurse | foreach { $_.Delete() }
}

# Генерируем по клиенту, на каждую версию API
ForEach ($swagger in Get-ChildItem ./swagger/*.json)
{
    $generatedDir = $outputDir + '\' + $swagger.BaseName;
    $packageName = 'apiClient_' + ($swagger.BaseName -replace '\.', '_');
    $packageVersion = ($swagger.BaseName -replace 'v', '') + '.0';
    Write-Host 'Generating for ' $generatedDir
    java -jar openapi-generator-cli-5.1.0.jar generate -i ('swagger\' + ($swagger.Name)) -g dart-dio -o $generatedDir --additional-properties=pubName=$packageName --additional-properties=pubVersion=$packageVersion
    $apiFile = $generatedDir + '\lib\api.dart';
    Write-Host 'Changing host to '  $apiHost
    ((Get-Content $apiFile) -replace 'http://localhost', $apiHost) | Set-Content $apiFile
    Set-Location $generatedDir
    Write-Host 'Flutter packages thing...'
    flutter pub get
    flutter pub upgrade --major-versions built_value built_collection built_value_generator build_runner
    Write-Host 'Codegen build runner...'
    flutter packages pub run build_runner build --delete-conflicting-outputs
}

Set-Location $location;
flutter pub get
param([string]$apiHost = 'https://localhost:5001')

$location = Split-Path $MyInvocation.MyCommand.Path;
$outputDir = $location + '\apiClient'
Set-Location $location


# Удаляем старые файлы если папка существует
if (Test-Path $outputDir)
{
    Get-ChildItem -Path $outputDir -Include * -File -Recurse | foreach { $_.Delete() }
}

# Генерируем по клиенту, на каждую версию API
ForEach ($swagger in Get-ChildItem ./swagger/*.json)
{
    $generatedDir = $outputDir + '\' + $swagger.BaseName;
    $pubName = 'apiClient_' + ($swagger.BaseName -replace '\.', '_');
    $pubVersion = ($swagger.BaseName -replace 'v', '') + '.0';
    $libName = 'api';
    Write-Host 'Generating for ' $generatedDir
    $gen = (java -jar openapi-generator-cli-5.1.0.jar generate `
        -i $swagger `
        -g dart-dio `
        -o $generatedDir `
        --additional-properties=pubName=$pubName `
        --additional-properties=pubVersion=$pubVersion `
        --additional-properties=pubLibrary=$libName)

    Write-Host $gen

    # Удаляем test папку со всеми тестами
    $testDir = $generatedDir + '\test';
    if (Test-Path $testDir)
    {
        Remove-Item -LiteralPath $testDir -Force -Recurse
    }

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

Set-Location $location
flutter pub get

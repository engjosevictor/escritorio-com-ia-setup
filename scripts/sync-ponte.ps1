# Ponte Claude Code <-> Codex: espelha .claude\skills em .agents\skills via junction.
# Idempotente, seguro rodar de novo a qualquer momento. Junction nao exige privilegio
# de administrador no Windows (diferente de symlink).

$root = Get-Location
$claudeSkills = Join-Path $root ".claude\skills"
$agentsDir = Join-Path $root ".agents"
$agentsSkills = Join-Path $agentsDir "skills"

if (-not (Test-Path $claudeSkills)) {
    Write-Host "Aviso: pasta .claude\skills nao encontrada em $root, nada pra ligar ainda."
    exit 0
}

if (-not (Test-Path $agentsDir)) {
    New-Item -ItemType Directory -Path $agentsDir -Force | Out-Null
}

if (Test-Path $agentsSkills) {
    $item = Get-Item $agentsSkills -Force
    if ($item.LinkType -eq "Junction") {
        $target = $item.Target
        if ($target -and ($target[0].TrimEnd('\') -eq $claudeSkills.TrimEnd('\'))) {
            Write-Host "Ponte ja existe e aponta pro lugar certo: .agents\skills -> .claude\skills"
            exit 0
        }
        else {
            Remove-Item $agentsSkills -Force -Recurse
        }
    }
    else {
        Write-Host "Aviso: $agentsSkills ja existe e nao e uma junction. Nada foi alterado, confira manualmente."
        exit 1
    }
}

try {
    New-Item -ItemType Junction -Path $agentsSkills -Target $claudeSkills -ErrorAction Stop | Out-Null
    Write-Host "Ponte criada: .agents\skills -> .claude\skills"
}
catch {
    try {
        cmd /c mklink /J "$agentsSkills" "$claudeSkills" | Out-Null
        Write-Host "Ponte criada (via mklink): .agents\skills -> .claude\skills"
    }
    catch {
        Write-Host "Falha ao criar a ponte: $_"
        exit 1
    }
}

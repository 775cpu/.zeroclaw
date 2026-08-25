@echo on
chcp 65001
cd /d "%~dp0"
:: ===== 基础配置（可按需修改） =====
set "PY_PATH=C:\QGB\miniforge3\python.exe"
set "GIT_PATH=C:\QGB\PortableGit\bin\git.exe"
set "BRANCH=master"
set "SIZE_THRESHOLD=104857600"
:: ==================================

:: 自动将 config.toml 复制为 config.toml.example 并对敏感字段（api_key 和 paired_tokens）进行脱敏清空
"%PY_PATH%" -c "import re, os; p=r'%~dp0/config.toml'; e=r'%~dp0/config.toml.example'; text=open(p,encoding='utf-8').read() if os.path.exists(p) else ''; text=re.sub(r'api_key\s*=\s*\".*?\"', 'api_key = \"\"', text); text=re.sub(r'paired_tokens\s*=.*', 'paired_tokens = []', text); open(e,'w',encoding='utf-8').write(text)"

:: 判断输入参数是否为空，为空则默认参数 -v3 -u push
if "%*"=="" (
    "%PY_PATH%" "D:\test\github\git.bat\git_logic.py" --retry=99 -v3 -u push
) else (
    "%PY_PATH%" "D:\test\github\git.bat\git_logic.py" %*
)

pause
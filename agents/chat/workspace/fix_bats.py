# -*- coding: utf-8 -*-
"""
批量精简 .zerocaw 目录下的 bat 文件
- 现有 bat 全部改为一行启动命令
- 缺失的 bat 自动补全创建
用法: python fix_bats.py
注意: 需要以管理员身份运行（修改 .zerocaw 目录）
"""

import os

ZEROCAW_DIR = r"C:\Users\Administrator\.zerocaw"
ZEROCAW_EXE = "%~dp0zerocaw.exe"

# bat 文件名 -> zerocaw 子命令
BATS = {
    "start-agent.bat":  "start-agent",
    "service-stop.bat": "service stop",
    "service-start.bat": "service start",
    "service-install.bat": "service install",
    "gateway.bat":      "gateway",
    "doctor.bat":       "doctor",
    "chat.bat":         "chat",
    "quickstart.bat":   "quickstart",
    "update.bat":       "update",
    "install.bat":      "install",
    "upgrade.bat":      "upgrade",
}

def main():
    created = []
    modified = []
    skipped = []

    for fname, cmd in BATS.items():
        path = os.path.join(ZEROCAW_DIR, fname)
        new_content = f"{ZEROCAW_EXE} {cmd}\n"
        new_stripped = new_content.strip()

        if os.path.exists(path):
            try:
                with open(path, "r", encoding="utf-8", errors="ignore") as f:
                    old = f.read().strip()
            except Exception as e:
                skipped.append(f"{fname}: 读取失败 ({e})")
                continue

            if old == new_stripped:
                skipped.append(f"{fname}: 已是目标内容，跳过")
            else:
                with open(path, "w", encoding="utf-8") as f:
                    f.write(new_content)
                modified.append(fname)
                print(f"  已修改: {fname}")
        else:
            with open(path, "w", encoding="utf-8") as f:
                f.write(new_content)
            created.append(fname)
            print(f"  已创建: {fname}")

    print(f"\n===== 完成 =====")
    print(f"  修改: {len(modified)} 个  {modified}")
    print(f"  创建: {len(created)} 个  {created}")
    print(f"  跳过: {len(skipped)} 个")
    for s in skipped:
        print(f"    - {s}")

if __name__ == "__main__":
    print(f"目标目录: {ZEROCAW_DIR}")
    print()
    main()
    input("\n按回车退出...")
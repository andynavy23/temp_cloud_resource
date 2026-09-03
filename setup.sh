#!/bin/bash

echo "====================================================="
echo "🚀 歡迎使用平台 GCP 監控授權自動設定腳本 (測試模式)"
echo "====================================================="
echo ""

# 1. 直接抓取指令後方帶入的第一個參數
CURRENT_PROJECT="$1"

# 2. 檢查參數是否為空，或是使用者忘記改掉預設字串
if [ -z "$CURRENT_PROJECT" ] \vert{}\vert{} [ "$CURRENT_PROJECT" == "<PROJECT-ID>" ]; then
    echo "❌ 錯誤：未偵測到有效的 Project ID！"
    echo "💡 請回到右側教學導覽確認，您是否已經將指令中的 <PROJECT-ID> 替換為真實的專案 ID。"
    echo ""
    echo "👉 正確範例：bash setup.sh \"my-real-project-123\""
    echo ""
    echo "請修改指令後，重新在終端機按下 Enter 執行。"
    echo "====================================================="
    exit 1
fi

# 切換 gcloud 環境至指定的專案，確保後續指令執行在正確的環境
gcloud config set project "$CURRENT_PROJECT" >/dev/null 2>&1

echo "✅ 目前指定的專案 ID：[$CURRENT_PROJECT]"
echo "⏳ 正在模擬套用 IAM 權限設定..."

# 3. 執行 IAM 綁定 (目前為測試模式，已將執行指令註解)
SERVICE_ACCOUNT="poc-bq-spark@rd-testing-6.iam.gserviceaccount.com"
ROLE="roles/viewer"

# gcloud projects add-iam-policy-binding "$CURRENT_PROJECT" \
#     --member="serviceAccount:$SERVICE_ACCOUNT" \
#     --role="$ROLE" \
#     --condition=None

# 4. 驗證與結束
echo ""
echo "🎉 恭喜！授權設定已成功跑完！"
echo "(目前為測試模式，實際綁定指令已被註解，未進行任何變更)"
echo "====================================================="
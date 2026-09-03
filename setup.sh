#!/bin/bash

echo "====================================================="
echo "🚀 歡迎使用平台 GCP 監控授權自動設定腳本 (測試模式)"
echo "====================================================="
echo ""

# ---------------------------------------------------
# [檢查一] 確認使用者是否正確傳入 Project ID
# ---------------------------------------------------
CURRENT_PROJECT="$1"

if [ -z "$CURRENT_PROJECT" ] || [ "$CURRENT_PROJECT" == "<PROJECT-ID>" ]; then
    echo "❌ 錯誤：未偵測到有效的 Project ID！"
    echo "💡 請回到右側教學導覽確認，您是否已經將指令中的 <PROJECT-ID> 替換為真實的專案 ID。"
    echo ""
    echo "👉 正確範例：bash setup.sh \"my-real-project-123\""
    echo ""
    echo "請修改指令後，重新在終端機按下 Enter 執行。"
    echo "====================================================="
    exit 1
fi

# ---------------------------------------------------
# [檢查二] 將終端機環境切換至客戶指定的專案
# ---------------------------------------------------
gcloud config set project "$CURRENT_PROJECT" >/dev/null 2>&1

echo "✅ 目前指定的專案 ID：[$CURRENT_PROJECT]"
echo "⏳ 正在模擬套用 IAM 權限設定..."

# ---------------------------------------------------
# [核心指令] 賦予平台監控 Service Account 讀取權限
# ---------------------------------------------------
SERVICE_ACCOUNT="poc-bq-spark@rd-testing-6.iam.gserviceaccount.com"
ROLE="roles/viewer"

# [開發者備註] 目前為測試模式，已將實際的 IAM 綁定指令註解
# gcloud projects add-iam-policy-binding "$CURRENT_PROJECT" \
#     --member="serviceAccount:$SERVICE_ACCOUNT" \
#     --role="$ROLE" \
#     --condition=None

# ---------------------------------------------------
# [結束] 顯示成功訊息
# ---------------------------------------------------
echo ""
echo "🎉 恭喜！授權設定已成功跑完！"
echo "(目前為測試模式，實際綁定指令已被註解，未進行任何變更)"
echo "您可以關閉此終端機，並回到平台介面繼續操作。"
echo "====================================================="
#!/bin/bash

echo "====================================================="
echo "🚀 歡迎使用平台 GCP 監控授權自動設定腳本"
echo "====================================================="
echo ""

# 1. 優先從 Cloud Shell 教學面板的隱藏環境變數中取得 Project ID
CURRENT_PROJECT="${GOOGLE_CLOUD_PROJECT:-$DEVSHELL_PROJECT_ID}"

# 如果環境變數抓不到，再嘗試從 gcloud 設定檔抓取
if [ -z "$CURRENT_PROJECT" ]; then
    CURRENT_PROJECT=$(gcloud config get-value project 2>/dev/null)
fi

# 2. 最終防呆機制（萬一真的都抓不到，或者抓到預設的無效字串）
if [ -z "$CURRENT_PROJECT" ] || [ "$CURRENT_PROJECT" == "<PROJECT-ID>" ]; then
    echo "⚠️ 尚未偵測到預設的 GCP 專案。"
    echo "正在為您列出可用的專案清單..."
    echo "-----------------------------------------------------"
    gcloud projects list --format="table(projectId,name)"
    echo "-----------------------------------------------------"

    read -p "👉 請輸入您要授權的 Project ID (第一欄): " SELECTED_PROJECT

    if [ -z "$SELECTED_PROJECT" ]; then
        echo "❌ 錯誤：未輸入 Project ID，腳本終止。"
        exit 1
    fi

    gcloud config set project "$SELECTED_PROJECT" >/dev/null 2>&1
    CURRENT_PROJECT=$SELECTED_PROJECT
fi

echo ""
echo "✅ 目前作用中的專案 ID：[$CURRENT_PROJECT]"
echo "⏳ 正在套用 IAM 權限設定..."

# 3. 執行 IAM 綁定
SERVICE_ACCOUNT="poc-bq-spark@rd-testing-6.iam.gserviceaccount.com"
ROLE="roles/viewer"

# 執行綁定指令
gcloud projects add-iam-policy-binding "$CURRENT_PROJECT" \
    --member="serviceAccount:$SERVICE_ACCOUNT" \
    --role="$ROLE" \
    --condition=None

# 4. 驗證與結束
if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 恭喜！授權設定已成功完成！"
    echo "您可以關閉此終端機，並回到監控平台繼續後續操作。"
else
    echo ""
    echo "❌ 授權設定失敗！"
    echo "請確認您是否有此專案的「IAM 管理員 (IAM Admin)」或「擁有者 (Owner)」權限，然後再試一次。"
fi
echo "====================================================="
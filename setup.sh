#!/bin/bash

echo "====================================================="
echo "🚀 歡迎使用平台 GCP 監控授權自動設定腳本"
echo "====================================================="
echo ""

# 1. 優先接收從 tutorial.md 傳進來的參數
CURRENT_PROJECT="$1"

# 2. 如果客戶忘記在右側選單選專案，就直接按了執行（傳入了預設字串），或者環境變數全空
if [ "$CURRENT_PROJECT" == "<PROJECT-ID>" ] || [ "$CURRENT_PROJECT" == "{{project-id}}" ] || [ -z "$CURRENT_PROJECT" ]; then

    # 嘗試從環境變數或 gcloud config 抓取
    CURRENT_PROJECT="${GOOGLE_CLOUD_PROJECT:-$DEVSHELL_PROJECT_ID}"
    if [ -z "$CURRENT_PROJECT" ]; then
        CURRENT_PROJECT=$(gcloud config get-value project 2>/dev/null)
    fi

    # 如果真的什麼都抓不到，啟動終極互動選單
    if [ -z "$CURRENT_PROJECT" ] || [ "$CURRENT_PROJECT" == "<PROJECT-ID>" ]; then
        echo "⚠️ 尚未偵測到您的 GCP 專案。"
        echo "正在為您列出可用的專案清單..."
        echo "-----------------------------------------------------"
        gcloud projects list --format="table(projectId,name)"
        echo "-----------------------------------------------------"

        read -p "👉 請複製並貼上您要授權的 Project ID (第一欄): " SELECTED_PROJECT

        if [ -z "$SELECTED_PROJECT" ]; then
            echo "❌ 錯誤：未輸入 Project ID，腳本終止。"
            exit 1
        fi

        CURRENT_PROJECT=$SELECTED_PROJECT
    fi
fi

# 切換 gcloud 環境至指定的專案
gcloud config set project "$CURRENT_PROJECT" >/dev/null 2>&1

echo ""
echo "✅ 目前作用中的專案 ID：[$CURRENT_PROJECT]"
echo "⏳ 正在套用 IAM 權限設定..."

# 3. 執行 IAM 綁定
SERVICE_ACCOUNT="poc-bq-spark@rd-testing-6.iam.gserviceaccount.com"
ROLE="roles/viewer"

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
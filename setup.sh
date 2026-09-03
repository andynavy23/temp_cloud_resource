#!/bin/bash

echo "====================================================="
echo "🚀 歡迎使用平台 GCP 監控授權自動設定腳本"
echo "====================================================="
echo ""

# 1. 取得當前預設的 Project ID (忽略錯誤訊息)
CURRENT_PROJECT=$(gcloud config get-value project 2>/dev/null)

# 2. 如果沒有設定預設 Project，引導使用者選擇
if [ -z "$CURRENT_PROJECT" ]; then
    echo "⚠️ 尚未偵測到預設的 GCP 專案。"
    echo "正在為您列出可用的專案清單..."
    echo "-----------------------------------------------------"
    # 列出客戶擁有的 Project ID 與名稱
    gcloud projects list --format="table(projectId,name)"
    echo "-----------------------------------------------------"
    
    # 提示使用者輸入
    read -p "👉 請輸入您要授權的 Project ID (第一欄): " SELECTED_PROJECT
    
    if [ -z "$SELECTED_PROJECT" ]; then
        echo "❌ 錯誤：未輸入 Project ID，腳本終止。"
        exit 1
    fi
    
    echo "🔄 正在將預設專案設定為：$SELECTED_PROJECT ..."
    gcloud config set project "$SELECTED_PROJECT"
    CURRENT_PROJECT=$SELECTED_PROJECT
fi

echo ""
echo "✅ 目前作用中的專案 ID：[$CURRENT_PROJECT]"
echo "⏳ 正在套用 IAM 權限設定..."

# 3. 執行 IAM 綁定
# ⚠️ 請將下方的 SERVICE_ACCOUNT 換成你們平台真實的 SA
SERVICE_ACCOUNT="your-monitoring-sa@your-platform-project.iam.gserviceaccount.com"
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
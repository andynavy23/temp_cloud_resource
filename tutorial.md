<walkthrough-tutorial-duration duration="3"></walkthrough-tutorial-duration>

# GCP 監控平台授權設定

歡迎使用自動化授權小幫手！本教學將引導您安全、快速地將 GCP 專案授權給我們的監控平台。

## 1. 選擇您的 GCP 專案

👉 **請在下方下拉選單中，選擇您希望被監控的 GCP 專案：**
*(選擇完成後，下方代碼區塊的 `<PROJECT-ID>` 會自動變成您的專案名稱)*

<walkthrough-project-setup></walkthrough-project-setup>

## 2. 執行授權腳本

確認下方代碼已經顯示您的專案 ID 後，👉 **請點擊右上角的「播放圖示 (Run in Cloud Shell)」**。

```bash
bash setup.sh "{{project-id}}"
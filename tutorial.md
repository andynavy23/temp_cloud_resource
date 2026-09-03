<walkthrough-tutorial-duration duration="3"></walkthrough-tutorial-duration>

# GCP 監控平台授權設定

歡迎使用自動化授權小幫手！本教學將引導您安全、快速地將 GCP 專案授權給我們的監控平台。

## 1. 選擇您的 GCP 專案

請在下方選擇您希望被監控的 GCP 專案。這會幫您自動完成 Cloud Shell 的環境設定：

<walkthrough-project-setup></walkthrough-project-setup>

## 2. 執行授權腳本

專案選擇完成後，我們準備了一支自動化腳本，將會賦予監控平台所需的讀取權限。

👉 **請點擊下方代碼區塊右上角的「播放圖示 (Run in Cloud Shell)」**，系統就會自動在左側終端機執行：

```bash
bash setup.sh
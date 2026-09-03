<walkthrough-tutorial-duration duration="3"></walkthrough-tutorial-duration>

# GCP 監控平台授權設定

歡迎使用自動化授權小幫手！本教學將引導您查詢專案 ID，並執行授權腳本。

## 1. 查詢您的專案 ID

如果您不確定有哪些專案可以使用，👉 **請點擊下方代碼區塊右上角的「播放圖示 (Run in Cloud Shell)」**，這會在左側列出您目前擁有權限的專案清單：

```bash
gcloud projects list --format="table(projectId,name)"
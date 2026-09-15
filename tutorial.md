<walkthrough-tutorial-duration duration="5"></walkthrough-tutorial-duration>

# GCP 監控平台授權設定

歡迎使用自動化授權小幫手！為了確保我們的監控平台能順利讀取您的雲端資源，請依照以下步驟完成 GCP Project 授權，完成後，AICOM 將可依授權範圍讀取此 Project 的雲端資源資料。

完成 GCP 端設定後，請返回 AICOM 進行資料驗證，驗證成功後，才會正式建立綁定。

## 1. 啟用必要 API

授權設定前，請先確認目標 Project 已啟用本授權流程所需的 GCP API，點擊下方按鈕即可一次啟用下列 API：

- Cloud Resource Manager API
- Compute Engine API
- Cloud SQL Admin API
- Cloud Storage API
- BigQuery API
- Cloud Monitoring API
- Vertex AI API
- Cloud Asset API

請注意：若該 API 已啟用，GCP 將不會重複設定。

<walkthrough-enable-apis apis="cloudresourcemanager.googleapis.com,compute.googleapis.com,sqladmin.googleapis.com,storage.googleapis.com,bigquery.googleapis.com,monitoring.googleapis.com,aiplatform.googleapis.com,cloudasset.googleapis.com"></walkthrough-enable-apis>

## 2. 選擇要串接 Project ID

請選擇本次要串接至 AICOM 的 GCP Project，系統將依您選擇的 Project 取得對應的 Project ID，並於後續執行授權 Script 時提供使用。

<walkthrough-project-setup></walkthrough-project-setup>

> **💡 提示：** 請複製下方顯示的 Project ID，稍後執行授權指令時會用到。

## 3. 確認執行 Script

為提升授權流程透明度，您可於執行前查看 setup.sh Script，確認本次授權將執行的設定內容。

👉 <walkthrough-editor-open-file filePath="setup.sh">查看 setup.sh Script</walkthrough-editor-open-file>

Script 主要用於將 AICOM Service Account 授予目標 Project 所需的 IAM 檢視權限。

## 4. 執行授權 Script

請先複製您所選擇串接的 Project ID，並將其帶入授權指令中執行。

Project ID
<walkthrough-project-id/>

接著複製下方指令，貼至左側 Cloud Shell 終端機（已自動帶入您於步驟 2 選擇的 Project ID）：

確認 Project ID 正確後，按下 Enter 執行。

授權完成後，請返回 AICOM，繼續進行資料驗證。

```bash
bash setup.sh "<walkthrough-project-id/>"
```
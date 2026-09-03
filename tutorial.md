<walkthrough-tutorial-duration duration="5"></walkthrough-tutorial-duration>

# GCP 監控平台授權設定

歡迎使用自動化授權小幫手！為了確保我們的監控平台能順利讀取您的雲端資源，請跟著以下步驟完成授權設定。

## 1. 啟用必要 API

為確保授權指令能順利與您的 GCP 溝通，請先點擊下方按鈕啟用必要的 API（Resource Manager API）。如果該專案已經啟用過，系統會自動快速跳過。

<walkthrough-enable-apis apis="cloudresourcemanager.googleapis.com"></walkthrough-enable-apis>

## 2. 查詢您的專案 ID

請在下方的選單中點擊，這會列出您目前擁有權限的專案。
找到您要授權的專案後，請留意選單下方顯示的 **Project ID**：

<walkthrough-project-setup></walkthrough-project-setup>

> **💡 提示：** 請將選單下方顯示的真實 Project ID（例如 `my-company-prod-123`）複製或記下來，稍後執行指令時會用到。

## 3. 確認腳本內容 (選用)

基於資安最佳實踐，我們公開透明所有的授權指令。如果您或您的 IT 團隊需要確認腳本實際執行的行為，可以直接在右側編輯器開啟檔案：

👉 <walkthrough-editor-open-file filePath="setup.sh">點擊此處展開 setup.sh 原始碼</walkthrough-editor-open-file>

*(註：腳本核心僅執行 `gcloud projects add-iam-policy-binding` 賦予基礎檢視權限，絕無其他非必要操作。)*

## 4. 執行授權腳本

請將下方的指令**複製並貼上到左側的黑色終端機**中。

> **⚠️ 重要提醒：**
> 貼上後請**絕對不要直接按 Enter**！請先利用鍵盤的左右方向鍵，將指令中的 `<PROJECT-ID>` 刪除，並替換為您剛剛在第 2 步取得的真實專案 ID。

```text
bash setup.sh "<PROJECT-ID>"
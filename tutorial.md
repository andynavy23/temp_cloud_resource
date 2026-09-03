<walkthrough-tutorial-duration duration="3"></walkthrough-tutorial-duration>

# GCP 監控平台授權設定

歡迎使用自動化授權小幫手！本教學將引導您查詢專案 ID，並執行授權腳本。

## 1. 查詢您的專案 ID

請在下方的選單中點擊，這會列出您目前擁有權限的專案。
您可以透過這個選單找到您要設定的專案，並確認它的 **Project ID**：

<walkthrough-project-setup></walkthrough-project-setup>

> **💡 提示：** 選擇完成後，選單下方會顯示該專案的真實 Project ID，請將那一串 ID 複製或記下來。

## 2. 執行授權腳本

請將下方的指令**複製並貼上到左側的終端機**中。

⚠️ **重要提醒：**
貼上後請**不要直接按 Enter**！請先利用鍵盤的左右方向鍵，將指令中的 `<PROJECT-ID>` 刪除，並替換為您剛剛在第一步確認的真實專案 ID。

```text
bash setup.sh "<PROJECT-ID>"
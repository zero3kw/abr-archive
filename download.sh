#!/bin/bash
set -e

download_by_list() {
  list_url=$1
  dir_name=$2

  mkdir -p $dir_name
  cd $dir_name

  echo "Downloading into $dir_name..."

  curl -s "$list_url" | awk -F "," 'NR > 1 {print $1}' | xargs -P 0 -n 1 curl -s -O

  # ZIPファイルがあれば解凍して削除
  for zip in *.zip; do
    [ -f "$zip" ] || continue
    unzip -o "$zip"
    rm "$zip"
  done

  cd ..
}

download_zip() {
  zip_url=$1
  dir_name=$2

  mkdir -p $dir_name
  cd $dir_name

  echo "Downloading into $dir_name..."

  # 旧バージョンのファイル（metadata_XXXX.txt 等）が残らないよう一旦クリア
  rm -f *.csv *.txt

  curl -sL "$zip_url" -o data.zip
  unzip -o data.zip
  rm data.zip

  cd ..
}

# すべてのカテゴリで実行
download_by_list "https://raw.githubusercontent.com/zero3kw/abr-download-sh/refs/heads/main/gov-csv-export-public/mt_pref/list.txt" "mt_pref"
download_by_list "https://raw.githubusercontent.com/zero3kw/abr-download-sh/refs/heads/main/gov-csv-export-public/mt_pref_pos/list.txt" "mt_pref_pos"
download_by_list "https://raw.githubusercontent.com/zero3kw/abr-download-sh/refs/heads/main/gov-csv-export-public/mt_city/pref/list.txt" "mt_city"
download_by_list "https://raw.githubusercontent.com/zero3kw/abr-download-sh/refs/heads/main/gov-csv-export-public/mt_city_pos/pref/list.txt" "mt_city_pos"
download_by_list "https://raw.githubusercontent.com/zero3kw/abr-download-sh/refs/heads/main/gov-csv-export-public/mt_town/pref/list.txt" "mt_town"
download_by_list "https://raw.githubusercontent.com/zero3kw/abr-download-sh/refs/heads/main/gov-csv-export-public/mt_town_pos/pref/list.txt" "mt_town_pos"

# 郵便番号データ（ArcGIS hosting / abr_post_code.zip）
download_zip "https://www.arcgis.com/sharing/rest/content/items/1098a4f61dab4f52997839d04245132a/data" "post_code"

# download_by_list "https://raw.githubusercontent.com/zero3kw/abr-download-sh/refs/heads/main/gov-csv-export-public/mt_rsdtdsp_blk/pref/list.txt" "mt_rsdtdsp_blk"
# download_by_list "https://raw.githubusercontent.com/zero3kw/abr-download-sh/refs/heads/main/gov-csv-export-public/mt_rsdtdsp_blk_pos/pref/list.txt" "mt_rsdtdsp_blk_pos"
# download_by_list "https://raw.githubusercontent.com/zero3kw/abr-download-sh/refs/heads/main/gov-csv-export-public/mt_rsdtdsp_rsdt/pref/list.txt" "mt_rsdtdsp_rsdt"
# download_by_list "https://raw.githubusercontent.com/zero3kw/abr-download-sh/refs/heads/main/gov-csv-export-public/mt_rsdtdsp_rsdt_pos/pref/list.txt" "mt_rsdtdsp_rsdt_pos"
# download_by_list "https://raw.githubusercontent.com/zero3kw/abr-download-sh/refs/heads/main/gov-csv-export-public/mt_parcel/city/list.txt" "mt_parcel"
# download_by_list "https://raw.githubusercontent.com/zero3kw/abr-download-sh/refs/heads/main/gov-csv-export-public/mt_parcel_pos/city/list.txt" "mt_parcel_pos"

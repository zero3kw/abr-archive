[![Dayly Download ABR CSVs](https://github.com/zero3kw/abr-archive/actions/workflows/daily-download.yml/badge.svg)](https://github.com/zero3kw/abr-archive/actions/workflows/daily-download.yml)

# abr-archive

```bash
% LC_TIME=C date                                                               
Thu Apr 17 00:38:25 JST 2025
% time bash ./download.sh
bash ./download.sh  132.31s user 55.10s system 126% cpu 2:28.49 total
% du -h -d 0 ./mt_*
336K	./mt_city
196K	./mt_city_pos
 17G	./mt_parcel
 11G	./mt_parcel_pos
4.0K	./mt_pref
4.0K	./mt_pref_pos
 84M	./mt_rsdtdsp_blk
212M	./mt_rsdtdsp_blk_pos
1.9G	./mt_rsdtdsp_rsdt
2.7G	./mt_rsdtdsp_rsdt_pos
151M	./mt_town
 25M	./mt_town_pos
% for dir in ./mt_*; do echo "$dir: $(find "$dir" -type f | wc -l) files"; done
./mt_city:       47 files
./mt_city_pos:       47 files
./mt_parcel:     1885 files
./mt_parcel_pos:     1843 files
./mt_pref:        1 files
./mt_pref_pos:        1 files
./mt_rsdtdsp_blk:       47 files
./mt_rsdtdsp_blk_pos:       47 files
./mt_rsdtdsp_rsdt:       47 files
./mt_rsdtdsp_rsdt_pos:       47 files
./mt_town:       47 files
./mt_town_pos:       47 files
```
- 町字より下位のデータはサイズが大きいので、町字までをアーカイブ

# 出典
- [アドレス・ベース・レジストリ（デジタル庁）](https://www.digital.go.jp/policies/base_registry_address/)

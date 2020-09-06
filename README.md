# README

<!-- アプリケーション名 -->
karte2

<!-- アプリケーション概要 -->
このアプリは肺炎病棟で使う医療カルテを、より管理しやすい様にイメージして作ったものである。

<!-- URL -->

<!-- テスト用アカウント -->

<!-- Basic認証 -->
ID:misao
PASS:0416

<!-- 利用方法 -->
1. ユーザー新規登録する（登録している場合はIDとパスワードを入力してログインする）。
2. 病棟一覧から担当する患者様情報をクリックする。
3. カルテに患者様の観察を行い、各観察項目に該当するものをそれぞれ選択していく。特記事項が有る場合も記述する。バイタルサインのグラフはバイタルサインの情報を登録した時点で自動で反映される。
4. 患者様の状態が回復・安定し、医師の指示で退院許可が有ればカルテ下部の"entrassen"ボタンから退院させる事が出来る（データ自体は削除はされない）。
5. 空きベッドが有れば新入院を受け入れることが出来る。
6. 新入院は"new_patient_adm"から行える。
7. 新規患者様登録を行う。
8. 医師が患者様の処置の指示を出すとき、各患者様の名前を右クリックし、帯状に出てきた処置を編集・登録する。
9. 看護師は担当する患者様の名前を右クリックして帯状に出てくる処置ボタンをクリックして、処置一覧を確認してから"add to do list"をクリックすると、自分のto do listsへ追加される。
10. 看護師はto do listsを参照しながら処置を行っていく。

<!-- 目指した課題解決 -->
医療現場でのカルテアプリを使用することによって、人的エラーによる医療ミスの予防や記録時間の減少に伴う生産性の向上に繋がる。
背景として私自身前職看護師と言う経験から、緊張でストレスが多く多忙な医療現場で電子カルテ導入に伴い、記録時間や人的エラーの減少・それに伴う生産性の向上が有ったことが大きなきっかけになる。
紙カルテは、医師の指示や看護師・リハビリ技師などによる記録においての誤字・脱字・字の読み辛さが有る。また、それにより医師の指示が確認出来無い事や、前日の患者様の状態はどうだったかなどの情報共有不足が起こる。こういった事で患者様に処置が行き届かないなどの医療ミスにつながる人的エラーが起こる事も多々有った。これは患者様にとっても不利益で有り、スタッフにとってもプレッシャーが大きく精神的にとても負担が強いもの。
また、紙カルテは1患者様につき1媒体なため、他に使用者がいればその人が使い終わるまで記録などは書けず、また共有したくても緊急で無い限り待たないといけない。
しかし、その後電子カルテに移行し人的エラーが大きく減り、カルテも自分のタイミングで使える事や、記録の編集も容易なため記録時間も短縮された。また、患者様の容態が悪化した時に1秒でも早く処置が必要な時など、紙カルテで医師の事前指示を探すより、電子カルテの方が圧倒的に早く探せる。これより、電子カルテは患者様の生死にも直結するものと考える。
しかし、現場はまだまだ必要な処置が行き届かないことなどの医療過誤や、記録時間が長く生産性がまだまだ低い事には変わり無い。
私は看護記録はまだまだずっと簡略化出来、コメディカルともっと共有しやすく出来ると考える。それにはアプリで管理していく事が必要と考える。例えば観察項目のタグに「肺の音」の項目を入れ、そこをタッチすると帯状に肺音の種類が出てくる様にする。そして該当するものをタッチして項目に入力される様になれば、ワードで記述するよりも格段に早く記録が出来る。また、表現の統一が出来る事もメリットと考える。例えば肺の音の表現として「湿性音」や「ラ音」「ヒュー音」など表現が統一されていないところは多い。全ての表現を覚えることは難しいので、統一出来ることはメリットにつながる。
こういったメリットにより、医療現場の医療ミスなどの予防・業務軽減・生産性の向上に繋がると考える。

<!-- 洗い出した要件 -->
:large_blue_circle:要件定義
<details><summary>機能名</summary>
*優先順位*
*目的*
*詳細*
*ストーリー（ユースケース）*
*見積もり（所要時間）*</details>

<details><summary>ユーザー管理機能</summary>
**3**

ユーザーの管理を行うため

新規登録、編集、ログイン、ログアウト、モデルの単体テスト
カルテを編集したり、閲覧するため。情報漏洩防止目的

カルテを編集したり、閲覧するため。情報漏洩防止目的

8/31-9/4</details>

<details><summary>患者情報管理機能</summary>
**3**

患者情報の管理を行うため

新規登録、編集、単体テスト

患者情報を参照するため

9/5-9/8</details>

<details><summary>カルテ管理機能</summary>
**3**

患者のデータを取り扱うため

記録、編集

ユーザーが指示を記入、記録を編集、閲覧、共有するため。

9/8-9/11</details>

<details><summary>経過表</summary>
**2**

患者のバイタルサインの経過が一目でわかる様にするため。

患者管理機能データから、血圧などののバイタルサインの値を取り出し、折れ線グラフとして表示する。

病状の回復度の指標で、表で経過を理解する事で速やかに状態把握して指示、介助・支援が行うことが出来る。

9/12-9/13</details>

<details><summary>処置一覧</summary>
**1**

当日の予定処置の確認のため

患者管理機能データから、処置予定をピックアップして時系列で並べる

看護師が処置一覧を見て、漏れなくその日の処置を予定通りに行える様にする。

9/14-9/17</details>

<!-- 実装した機能についてのGIFと説明 -->

<!-- 実装予定の機能 -->
要件定義に挙げた機能を優先順位を考慮して実装していく。

<!-- データベース設計	 -->
ファイル名：ER.drawio参照
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :patient_users
- has_many :patients, through: :patient_users
- has_one :to do lists

## patients テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| p_num         | integer    | null: false |
| image         | text       | null: false |
| name          | string     | null: false |
| birth_date       | datetime       | default: "" |
| tel          | string | default: "" |
| post_num      | string    | default: "" |
| prefecture_id   | integer    | default: "" |
| city  | string    | default: "" |
| house_num   | string    | default: "" |
| apart_name     | string    | default: "" |
| key_person         | string    | default: "" |
| kp_tel         | integer    | default: "" |
| main_disease         | string    | null: false |
| sub_disease         | string    | default: "" |
| main_doctor         | string    | null: false |
| user          | references | null: false, foreign_key: true |

### Association
- has_many :patient_users
- has_many :users, through: :patient_users
- belongs_to_active_hash :prefecture
- belongs_to :to_do_lists
- has_many :treatments
- has_one :monitors
- has_one_attached :image

## patient_users テーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| user_id  | references  | null: false, foreign_key: true |
| patient_id  | references  | null: false, foreign_key: true |

### Association

- belongs_to :patient
- belongs_to :user

## monitors テーブル

| Column   | Type     | Options                        |
| -------- | --------  | ------------------------------ |
| patient_id  | references  | null: false, foreign_key: true |
| user_id  | references | null: false, foreign_key: true |
| temperature         | integer    |
| pulse         | integer    |
| respiration         | integer    |
| blood_pressure         | integer    |
| spo2         | integer    |
| food_intake         | integer    |
| water_intake         | integer    |
| excresion         | integer    |
| atten_sound         | integer    |
| lung_sound         | integer    |
| sputum         | integer    |
| cough         | integer    |
| sleep         | integer    |
| time         | string    | null: false |
### Association
- belongs_to :patients

## treatments テーブル

| Column   | Type     | Options                        |
| -------- | --------  | ------------------------------ |
| patient_id  | references  | null: false, foreign_key: true |
| time         | string    | null: false |
| test         | string    |
| medicine         | string    |

### Association
- belongs_to :patients

## to_do_lists テーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| user_id  | references  | null: false, foreign_key: true |
| patient_id  | references  | null: false, foreign_key: true |

### Association
- has_many :patients
- belongs_to : users

<!-- ローカルでの動作方法 -->
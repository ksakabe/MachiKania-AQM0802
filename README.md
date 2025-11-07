# MachiKania-AQM0802

MachiKaniaで8x2 LCDディスプレイAQM0802を使用するクラスファイルです。`AQM0802.BAS`をカレントディレクトリあるいは`/LIB/AQM0802/`に保存します。


# メソッド

AQM0802クラスには次のメソッドがあります。

## コンストラクタ:INIT

AQM0802を初期化するメソッドです。引数にAQM0802のI<sup>2</sup>Cアドレスを指定します。

`AQM0802::INIT(A)`

- A : AQM0802のI<sup>2</sup>Cアドレス

``` BASIC
A=$3E
AQM0802::INIT(A)
```

## 文字列出力メソッド : WSTR

引数に指定した行､列に文字列を出力します。

`AQM0802::WSRT(R, C, S$)` 

- R : 行の指定1または2
- C : 列の指定1から8
- S$ : 出力する文字列

``` BASIC
R=1
C=1
S$="Hello"
AQM0802::WSRT(R,C,S$)
```

## 画面クリアメソッド : CLCD

LCD画面をクリアします。

`AQM0802::CLCD()`

# 使用例

LCD初期化後､1行目に`HELLO`､2行目に`World`を表示し､2行目の8桁目から1桁目に向けて8から1の数字を表示します。

``` BASIC:AQM0802T.BAS
USECLASS AQM0802
A=$3E

CALL AQM0802::INIT(A)
CALL AQM0802::CLS()

CALL AQM0802::WSTR(1,1,"HELLO")
CALL AQM0802::WSTR(2,1,"World")

FOR I=8 TO 1 STEP -1
  CALL AQM0802::WSTR(2,I,DEC$(I))
  DELAYMS 500
NEXT

WHILE INKEY()=0:WEND

CALL AQM0802::CLCD()
END
```

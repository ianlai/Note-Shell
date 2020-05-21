## 替換單字
```
sed 's/<old>/<new>/g' > <new-file-name>
```

## 替換範圍
例如替換掉<div>xxx</div>中的xxx，改成ooo
-> 使用`.*`代表任意

```
sed 's/<FROM>.*<TO>/<FROM>NEW<TO>/g'
```

例如把div中的文字消去：
```
sed 's/\<div\>.*\<\/div\>/\<div\>\<\/div\>/g'
```

## 批次修改

1. 找出檔名內有`abc`的文件
2. 把這些文件內的 `[** xyz **]` 全部去除 (xyz為任意字串)
3. 把文件另外存成 `revised-[原檔名]`

```
revise.sh 

REPO=$1 
for FILE in `ls | grep $REPO` 
do 
  sed 's/\[\*\*.*\*\*\]//' $FILE > revised-$FILE 
done
```
```
>> revise.sh abc
```
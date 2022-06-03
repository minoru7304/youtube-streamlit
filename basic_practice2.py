#25
names = ["John", "Kevin", "Louis"]
for name in names:
    print(name)

#26 #27 #28
for i in range(10):
    if i ==3:
        print("スルー！")
        continue

    if i == 6:
        print('終了！')
        break
    print(i)
#29 複数のリストを同時に処理

lasts = ["加藤", "佐藤", "田中"]
firsts = ["雄一", "拓也", "太郎"]

for last, first in zip(lasts, firsts):
    print(last + first)

#30
lasts=["加藤", "佐藤", "田中"]

for i, last in enumerate(lasts):
    print(i, last)

#31

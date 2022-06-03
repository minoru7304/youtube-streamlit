import  streamlit as st
#import numpy as np
#import pandas as pd
import time
#from PIL import Image

st.title('Streamlit 超入門')

#st.write('Interactive Widgets')
st.write('プログレスバーの表示')
'Start!!'

latest_iteration = st.empty()
bar = st.progress(0)

for i in range(100):
    latest_iteration.text(f'Iteration {i+1}')
    bar.progress(i + 1)
    time.sleep(0.01)

'Done!!!'

###レイアウトを整える

#サイドバーを追加
# text = st.sidebar.text_input('あなたの趣味を教えてください')
# condition = st.sidebar.slider('あなたの今の調子は？', 0, 100, 50)

# 'あなたの趣味：',text
# 'コンディション：', condition

# #2カラムレイアウトにする
# left_column, rigth_column = st.columns(2)
# button = left_column.button('右カラムに文字を表示')

# if button:
#     rigth_column.write('ここは右カラム')

#expanderの追加
expander1 = st.expander('問合せ1')
expander1.write('問合せ1の回答')
expander1 = st.expander('問合せ2')
expander1.write('問合せ2の回答')
expander1 = st.expander('問合せ3')
expander1.write('問合せ3の回答')


###




#スライダーによる値の動的変更
#condition = st.slider('あなたの今の調子は？', 0, 100, 50)
#'コンディション：', condition

# text = st.text_input('あなたの趣味を教えてください')
# 'あなたの趣味：',text

# option = st.selectbox(
#     'あなたが好きな数字をおしえてください',
#     list(range(1, 11))
# )

# 'あなたの好きな数字は' , option , 'です。'

#チェックボックスによるメディアの表示可否
# if st.checkbox('Show Image'):
#     img = Image.open('sample.jpg')
#     st.image(img, caption='定期情報', use_column_width=True)













#st.write('DataFrame')

#df = pd.DataFrame(
#    np.random.rand(100, 2)/[50, 50] + [35.69, 139.70],
#    columns=['lat', 'lon']
#)
##df
#st.write #細かい指定ができない
#st.dataframe(df.style.highlight_max(axis=0)) #細かい指定ができる
#st.table(df.style.highlight_max(axis=0)) #静的なテーブル

#st.map(df)
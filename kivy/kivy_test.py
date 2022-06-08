from kivy.app import App
from kivy.uix.label import Label

from kivy.core.text import LabelBase, DEFAULT_FONT
from kivy.resources import resource_add_path

#実行方法：python kivy_test.py
#Windowsは、C:\Windows\Fonts

resource_add_path("C:\Windows\Fonts")
LabelBase.register(DEFAULT_FONT, "meiryo.ttc")

#App().run()

class TextApp(App):
    def build(self):
        return Label(text="Hello kivy")

TextApp().run()
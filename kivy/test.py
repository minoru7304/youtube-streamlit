from kivy.app import App

from kivy.core.text import LabelBase, DEFAULT_FONT
from kivy.resources import resource_add_path

#実行方法：python kivy_test
resource_add_path("C:\Windows\Fonts")
LabelBase.register(DEFAULT_FONT, "meiryo.ttc")

class TestApp(App):
    pass

if __name__=="__main__":
    TestApp().run()

   M S B A M L   `   `   `  ����G  CClientWebCam, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ClientWebCamClientWebCam  5   	       ClientWebCam.Join   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:ClientWebCam     5   	     � Title$
  Join��5   	   $	��640��6   $	��360��6#    � 	Resources 5	         TextBox.Static.Border �� Color  TextBox.MouseOver.Border  TextBox.Focus.Border  TextBoxStyle1 �� 
TargetType �� Property!  System.Windows.SystemColors   WindowBrushKey �� Value   ControlTextBrushKey-  'System.Windows.Input.KeyboardNavigation �� 
TargetType	 ��Name
 �� CornerRadius J� SnapsToDevicePixels ��Name �� Triggers P� Property P� Value �� 
TargetName �� Triggers ]� 
Conditions �� Property �� Value)   "InactiveSelectionHighlightBrushKey  FocusVisual �� StrokeDashArray  Button.Static.Background  Button.Static.Border  Button.MouseOver.Background  Button.MouseOver.Border 	 Button.Pressed.Background 
 Button.Pressed.Border  Button.Disabled.Background  Button.Disabled.Border  Button.Disabled.Foreground  ButtonStyle1 ��Name   HighlightBrushKey��%v  &	        &	 #     &	 F     &	 i     7   7  7  &	 �    &	 b    &	 �    &	 �    &	 �    &		 �    &	
     &	 4    &	 W    &	 z    &	 �    7  7  7  7  7  7 	 7 
 7  7  7  �� 5
   
   $ 	#FFABAdB3��68   �� 5   
   $ 	#FF7EB4EA��6;   �� 5   
   $ 	#FF569DE5��67   �� 5   
   " ��6&   .�5      ��  � ��# �  6+   �� 5       � ��8   6,   �� 5       � ��# �  6+   �� 5       � ��$ 1q�60   �� 5       �@ TabNavigation$
 None=�6A   �� 5       � ��$
 Left=�6;   �� 5       �@�FocusVisualStyle 61   Z� �� 5       �@J�	AllowDrop$
 true��6*   �� 5       �@��PanningMode$ VerticalFirst=�69   �� 5       �@��IsFlicksEnabled$ False��67   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� $	 border��6!   #��z��61   $
 7��6[   #��z��6l   #��z��6�   $
 True��6�   ._�5      �� $ PART_ContentHost��6+   $|�false��6E   $��Hidden=�6W   $��Hidden=�6~   5       5      P� 5       � {�$ false��6;   . �5    "   �� $ border��6<    �@J�Opacity$
 0.56Q�6P   5!      P� 5"       �@J�IsMouseOver$
 true��6=   . �5#   "   �� $ border��6@   8   � ��6T   5$      P� 5%       �@J�IsKeyboardFocused$
 true��6C   . �5&   "   �� $ border��6@   8   � ��6T   5'      5)      5+       5,      ]� 5-       5.      �� 5/      + �@��#IsInactiveSelectionHighlightEnabled$
 true��6S   �� 50       �@��IsSelectionActive$ false��6A   ./�52      ��  �@��SelectionBrush# �  67   53      55      �� 56   
   .�57      ��  � �� 58      �� 59      .R�5:      �� $��2q�6$   $	 1 2R�6/   #���  6E   $
 true��6�   $��1��6�   5;      5=      5>      �� 5?   
   $ 	#FFDDDDDD��6;   �� 5@   
   $ 	#FF707070��67   �� 5A   
   $ 	#FFBEE6FD��6>   �� 5B   
   $ 	#FF3C7FB1��6:   �� 5C   
   $ 	#FFC4E5F6��6<   �� 5D   
   $ 	#FF2C628B��68   �� 5E   
   $ 	#FFF4F4F4��6=   �� 5F   
   $ 	#FFADB2B5��69   �� 5G   
   $ 	#FF838383��6=   �� 5H   
   " ��6%   .�5I      ��  �@�FocusVisualStyle8   61   �� 5J       � ��8  6+   �� 5K       � ��8  6,   �� 5L       � ��# �  6+   �� 5M       � ��$ 1q�60   �� 5N       � ��$ Center=�6;   �� 5O       � ��$ Center=�69   �� 5P       � ��$ 1q�6(   �� 5Q       � �� 5R      �� 5S      " ��6&   .R�5T      �� $	 border��6!   #��z��61   $
 7��6[   #��z��6m   #��z��6�   $
 true��6�   ._�5U      �� $ contentPresenter��6/   $|�False��6I   #��z��6[   #��z��6�   $
��True��6�   # z 6�   #��z��6  5V       5W      P� 5X       �@��IsDefaulted$
 true��6=   . �5Y   "   �� $ border��6@   # �  6T    � ��5Z      P� 5[       �@J�IsMouseOver$
 true��6=   . �5\   "   �� $ border��6?   8   � ��6S   �� 5]   "   $ border��6@   8   � ��6T   5^      P� 5_       � ��$
 true��6;   . �5`   "   �� $ border��6?   8   � ��6S   �� 5a   "   $ border��6@   8   � ��6T   5b      P� 5c       � {�$ false��6;   . �5d   "   �� $ border��6?   8   � ��6S   �� 5e   "   $ border��6@   8   � ��6T   �� 5f   "   $ contentPresenter��6K   8 	  � ��6i   5g      5i      5k      5l      5m      .��5n      �  � ColumnDefinitions 5o   
   �� 5p      $
��Auto �6   $	��169��6,   �� 5q       � RowDefinitions 5s   
   �� 5t      $
��Auto �6   �� 5u      $
��Auto �6   �� 5v      $
��Auto �6   $	��319��6*   �� 5w      .+�5y   
   �� $��이름��6   $��SemiBold"�6   $
��Left=�63   $��
113,61,0,0q�6N   $	��Top=�6b   $��20(�6z   $��35��6�   $��2��6�   $��50��6�    J� RenderTransformOrigin$ 0.572,-1.915&�6�   �� 5z   
   $��	아이디��6   $��SemiBold"�6   $
��Left=�64   $��
95,101,0,0q�6O   $	��Top=�6c   $��2��6{   $��20(�6�   $��36��6�   $��70��6�   �� 5{   
   $��비밀번호��6   $��SemiBold"�6   $
��Left=�65   $��74,0,0,0q�6P   $��Center=�6b   $��2��6}   $��20(�6�   $��36��6�   $��90��6�   �� 5|   
   $��핸드폰번호��6   $��SemiBold"�6    $
��Left=�66   $��
55,183,0,0q�6Q   $	��Top=�6e   $��2��6}   $��20(�6�   $��36��6�   $	��110��6�   �� 5}   
   $��나이��6   $��SemiBold"�6   $
��Left=�63   $��112,263,0,0q�6N   $��2��6c   $��20(�6p   $��50��6~   $��36��6�   $	��Top=�6�   �� 5~   
   $��성별��6   $��SemiBold"�6   $
��Left=�63   $��112,293,0,0q�6N   $	��Top=�6c   $��2��6{   $��20(�6�   $��36��6�   $��50��6�   $��2��6�   �� 5   
   $	��키��6   $��SemiBold"�6   $
��Left=�62   $��	132,6,0,0q�6M   $	��Top=�6`   $��3��6x   $��20(�6�   $��36��6�   $��28��6�   �� 5�   
   $��	몸무게��6   $��SemiBold"�6   $
��Left=�64   $��	91,33,0,0q�6O   $	��Top=�6b   $��3��6z   $��20(�6�   $��36��6�   $��69��6�   �� 5�   
   -   5         ��Name$ TxT_Name��5�   :   #���  6   $��1��6L   $
��Left=�6\   $��1,70,0,0q�6w    �� TextWrapping$
 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��120��6�   $��25��6�   $��2��6�   �� 5�   
   -   5        $ TxT_Id��5�   :   #���  6   $��1��6J   $
��Left=�6Z   $��	1,109,0,0q�6u   $
 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��120��6�   $��25��6�   $��2��6�   �� 5�   
   -   5        $ TxT_Pw��5�   :   #���  6   $��1��6J   $
��Left=�6Z   $��1,0,0,0q�6u   $
 Wrap=�6�   $�� ��6�   $��Center=�6�   $	��120��6�   $��25��6�   $��2��6�   �� 5�   
   -   5        $ TxT_PN��5�   :   #���  6   $��1��6J   $
��Left=�6Z   $��	1,192,0,0q�6u   $
 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��120��6�   $��25��6�   $��2��6�   �� 5�   
   -   5         ��Name$ Btn_Join��5�   Z   #���  6   $��20(�69   $��Black"�6G   $��회원가입��6l   $��2��6{   $
��Left=�6�   $��
91,153,0,0q�6�   $��3��6�   $	��Top=�6�   $	��160��6�   $��35��6�   6�   �� 5�   
   -   5        $ txt_age��5�   :   #���  6   $��1��6K   $
��Left=�6[   $��	1,270,0,0q�6v   $��2��6�   $
 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��120��6�   $��25��6�   �� 5�   
   -   5        $ 
txt_height��5�   :   #���  6   $��1��6N   $
��Left=�6^   $��1,12,0,0q�6y   $��3��6�   $
 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��120��6�   $��25��6�   �� 5�   
   -   5        $ 
txt_weight��5�   :   #���  6   $��1��6N   $
��Left=�6^   $��1,41,0,0q�6y   $��3��6�   $
 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��120��6�   $��25��6�   �� 5�   
   -	   5        $ 
txt_gender��5�   :   #���  6   $��1��6N   $
��Left=�6^   $��	1,300,0,0q�6y   $��2��6�   $
 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��120��6�   $��25��6�   $��2��6�   5�      5�      
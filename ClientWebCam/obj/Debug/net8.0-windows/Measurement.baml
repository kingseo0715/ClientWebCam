   M S B A M L   `   `   `  ����G  CClientWebCam, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ClientWebCamClientWebCam  5   	       ClientWebCam.Measurement   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:ClientWebCam     5   	     � Title$  마이페이지_측정��5   	   $	��640��6   $	��360��6'    � 	Resources 5	         FocusVisual �� Property �� Value �� StrokeDashArray!  System.Windows.SystemColors   ControlTextBrushKey J� SnapsToDevicePixels  Button.Static.Background �� Color  Button.Static.Border  Button.MouseOver.Background  Button.MouseOver.Border  Button.Pressed.Background  Button.Pressed.Border  Button.Disabled.Background  Button.Disabled.Border 	 Button.Disabled.Foreground 
 ButtonStyle1 �� 
TargetType	 �� 
TargetType
 ��Name �� CornerRadius ��Name �� Triggers P� Property P� Value �� 
TargetName   HighlightBrushKey��%�  &	        &	 �     &	 �     &	 �     &	     &	 ?    &	 b    &	 �    &	 �    &		 �    &	
 �    7   7  7  7  7  7  7  7  7  7 	 �� 5
   
   .�5      ��  � �� 5      �� 5      .R�5      �� $��2q�6$   $	 1 2R�6/   #���  6E   $
 true��6�   $��1��6�   5      5      5      �� 5   
   $ 	#FFDDDDDD��6;   �� 5   
   $ 	#FF707070��67   �� 5   
   $ 	#FFBEE6FD��6>   �� 5   
   $ 	#FF3C7FB1��6:   �� 5   
   $ 	#FFC4E5F6��6<   �� 5   
   $ 	#FF2C628B��68   �� 5   
   $ 	#FFF4F4F4��6=   �� 5   
   $ 	#FFADB2B5��69   �� 5   
   $ 	#FF838383��6=   �� 5   
   " ��6%   .�5      ��  �@�FocusVisualStyle8   61   �� 5       � ��8  6+   �� 5       � ��8  6,   �� 5        � ��# �  6+   �� 5!       � ��$ 1q�60   �� 5"       � ��$ Center=�6;   �� 5#       � ��$ Center=�69   �� 5$       � ��$ 1q�6(   �� 5%       � �� 5&      �� 5'      "	 ��6&   .R�5(      �� $
 border��6!   $ 10��61   #��z��6C   #��z��6m   #��z��6�   $
 true��6�   ._�5)      �� $ contentPresenter��6/   $|�False��6I   #��z��6[   #��z��6�   $
��True��6�   # z 6�   #��z��6  5*       5+      P� 5,       �@��IsDefaulted$
 true��6=   . �5-   "   �� $ border��6@   # �  6T    � ��5.      P� 5/       �@J�IsMouseOver$
 true��6=   . �50   "   �� $ border��6?   8   � ��6S   �� 51   "   $ border��6@   8   � ��6T   52      P� 53       � ��$
 true��6;   . �54   "   �� $ border��6?   8   � ��6S   �� 55   "   $ border��6@   8   � ��6T   56      P� 57       � {�$ false��6;   . �58   "   �� $ border��6?   8   � ��6S   �� 59   "   $ border��6@   8   � ��6T   �� 5:   "   $ contentPresenter��6K   8 	  � ��6i   5;      5=      5?      5@      5A      .��5B      �  � ColumnDefinitions 5C   
   �� 5D      $
��Auto �6   �� 5E      $��* �6    � RowDefinitions 5G   
   �� 5H      $
��Auto �6   �� 5I      $
��Auto �6   �� 5J      $��* �6   .+�5M   
   �� -   5        $��Cam_1��5M      6   �� 5P   
   -   5         ��Name$ txt_user��5P      $
��Bold"�6$   $��20(�67   $
��Left=�6E   $��
42,123,0,0q�6`    �� TextWrapping$
 Wrap=�6t   $�� ��6�   $	��Top=�6�   $	��120��6�   $��30��6�   $��Right=�6�   ��6�   Z� �� 5Q   
   $
��Left=�6   $
��Bold"�6-   $��165,123,0,0q�6?   $
 Wrap=�6T   $��님 환영합니다.��6h   $��20(�6x   $	��Top=�6�   $	��147��6�   $��30��6�   $��2��6�   ��6�   Z� 6�   �� 5R   
   -   5        #��� 
 5R      $��30(�68   $
��Bold"�6F   $��측정하기��6Y   $
��Left=�6h   $��
78,190,0,0q�6�   $	��Top=�6�   $	��200��6�   $	��303��6�    J� RenderTransformOrigin$ 0.5,0.5&�6�   6�   5V      5W      
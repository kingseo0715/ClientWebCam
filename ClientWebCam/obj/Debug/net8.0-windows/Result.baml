   M S B A M L   `   `   `  ����G  CClientWebCam, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ClientWebCamClientWebCam  5   	       ClientWebCam.Result   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:ClientWebCam     5   	     � Title$  결과페이지��5   	   $	��640��6   $	��360��6$   .��5	      �  � ColumnDefinitions 5
   
   �� 5      $
��Auto �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      .+�5   
   �� -   5         ��Name$ txt_user��5      $��20(�6$   $
��Bold"�62   $
��Left=�6D   $��	32,24,0,0q�6_    �� TextWrapping$
 Wrap=�6r   $�� ��6�   $	��Top=�6�   $	��134��6�   $��30��6�   $��Right=�6�   ��6�   Z� 6�   �� 5   
   $
��Left=�6   $��
171,24,0,0q�6-   $
 Wrap=�6A   $��님의 측정 결과��6U   $��20(�6e   $
��Bold"�6s   $	��Top=�6�   $	��153��6�   $��30��6�   ��6�   Z� �� 5   
   -   5         ��Name$ measureImage��5      $F��@C:\\Users\\lms5\\source\\repos\\TestWebcam\\TestWebcam\\save.jpg��6&   $��48,65,66,128q�6q   $	��250��6�   6�   �� 5   
   -   5         ��Name$ predictListview��5      $��24,461,40,0q�6,   $
��Bold"�6A   $��20(�6S   $��2��6a    �� View 5      �� 5      .P�5      �� $	��Tag��6%    �� Width$	 130��5      	 �� DisplayMemberBinding	 5      �� *	tagName+�� 5      $��Probability��6%   $	 160��5       	 5!      �� *probability+
 �� StringFormat$
 P2��5"      5$      5(      5)      
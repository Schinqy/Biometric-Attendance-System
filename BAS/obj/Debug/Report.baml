   M S B A M L   `   `   `  ����V  RPatient Observations System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:Patient_Observations_SystemPatient_Observations_System  5   	   (    "Patient_Observations_System.Report   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ;local)clr-namespace:Patient_Observations_System     5   	   -   5          � Title$  Report��5   	   $	��700��6   $
��1050��6%    � 
ResizeMode$ CanMinimize=�62    � 	Resources 5	         BorderGapMaskConverter  GroupBoxStyleRounded �� 
TargetType �� Property �� Value �� 
TargetType J� SnapsToDevicePixels � ColumnDefinitions	 � RowDefinitions
 �� CornerRadius J� OpacityMask `� ConverterParameter `� 	Converter �� ElementName �� Path �� RelativeSource ��Name �� Padding��%"  &	        &	      7   �� 5
   
   6!   �� 5   
   " ��6-   .�5      ��  � �� �#D5DFE56,   �� 5       � ��$ 1q�60   �� 5       � �� 5      �� 5      " ��6&   .R�5      �  .  5      �� 5   "   $��6 �63   �� 5   "   $
��Auto �63   �� 5   "   $��* �63   �� 5   "   $��6 �63   	 5      �� 5   "   $
��Auto �60   �� 5   "   $
��Auto �60   �� 5   "   $��* �60   �� 5   "   $��6 �60   .+�5      �� 
������ #��z��6?   #��z��6s   $��4��6�   $��0��6�   $
 4��6�   $��1��6�   $��3��6�   �� 5      
�������#��z��69   $��4��6m   $
 10��6�   $��1��6�   $��3��6�    5    "   `� 5!   &   $ 7��63   8   .1�5"   *   �� $ Header��62   $ ActualWidth�6G   �� 5#   *   $ ActualWidth�62    6E   �� *Self+�� 5$   *   $ ActualHeight�62    6F   �� *Self+5%   '   ._�5'   "   �� #��z��6)   #��z��6U   $
 10��6�   ._�5(   &   �� 
�������#��z��6A   $
 10��6u   5)   #   5*      �� 5+      $ Header��6%   $��1��65   $ 3,1,3,0q�6E   $��0��6W   $��2��6d   ._�5,   "   �� $��Header��63   ��. # z 6e   5-      �� 5.      $��2��6/   $��1��6C   #��z��6S   $��2��6v   # z 6�   5/      50      52      53      54      .��55      � ���	#FF333337.+�56   
   �� -   5         ��Name$ groupBox��56      $��Employee Report��6%   $
��Left=�6>   $��	10,10,0,0q�6Y   $	��Top=�6l   $	��632��6�   $	��665��6�   ���	#FFE0D514$��24(�6�   #���  6�   ���	#FF3F3F46 K� ZIndex$ -1��6  ���	#FFE0D514$��Italic$�62  .��57      &   System.Windows.Controls.DataGrid  -   5          Name$ dataGrid��57      $
��Left=�6)   $��
10,58,-2,0q�6D   $	��Top=�6X   $	��525��6p   $	��627��6}   58      �� 59   
   -   5         ��Name$ headingLabel��59      $!��Chamisa Nelson April Report��6&   $
��Left=�6L   $��	31,48,0,0q�6g   $	��Top=�6z   $��Italic$�6�   $��25(�6�   $��Segoe UI Semibold)�6�   
�������$	��596��6�   �� 5:   
   -   5        $ label1��5:      $��Total Late Hours:��6    
�������$
��Left=�6O   $��707,214,0,0q�6j   $	��Top=�6   $	��192��6�   $��22(�6�   �� 5;   
   -   5        $ lateHrsLabel��5;      $��x Hours��6&   
�������$
��Left=�6K   $��707,258,0,0q�6f   $	��Top=�6{   $	��192��6�   $��22(�6�   �� 5<   
   -   5        $ label1_Copy1��5<      $��Total Overtime Hours:��6&   
�������$
��Left=�6Y   $��707,300,0,0q�6t   $	��Top=�6�   $	��238��6�   $��22(�6�   �� 5=   
   -   5        $ 
otHrsLabel��5=      $��x Hours��6$   
�������$
��Left=�6I   $��707,344,0,0q�6d   $	��Top=�6y   $	��192��6�   $��22(�6�   �� 5>   
   -	   5        $ label1_Copy3��5>      $��Overtime Bonus (USD$)��6&   
�������$
��Left=�6Y   $��707,408,0,0q�6t   $	��Top=�6�   $	��284��6�   $��22(�6�   �� 5?   
   -
   5        $ otBonusLabel��5?      $
��x.XX��6&   
�������$
��Left=�6H   $��707,452,0,0q�6c   $	��Top=�6x   $��87��6�   $��22(�6�   �� 5@   
   -   5        $ label1_Copy5��5@      $��
Late Flags��6&   
�������$
��Left=�6N   $��707,502,0,0q�6i   $	��Top=�6~   $	��238��6�   $��22(�6�   �� 5A   
   -   5        $ 	lateLabel��5A      $��x��6#   
�������$
��Left=�6B   $��707,546,0,0q�6]   $	��Top=�6r   $	��192��6�   $��22(�6�   �� 5B   
   -   5         ��Name$ btnBack��5B      $
��Back��6"   $
��Left=�61   $��680,608,0,0q�6L   $	��Top=�6a   $	��160��6y   $��47��6�   $��24(�6�   6�   �� 5C   
   -   5        $ btnHome��5C      $
��Home��6"   $
��Left=�61   $��878,608,0,0q�6L   $	��Top=�6a   $	��156��6y   $��47��6�   $��24(�6�   6�   �� 5D   
   -   5        $ label1_Copy7��5D      $��Month��6&   
�������$
��Left=�6I   $��	707,0,0,0q�6d   $	��Top=�6w   $	��192��6�   $��22(�6�   �� 5E   
   -   5         ��Name$ comboBox��5E      $
��Left=�6%   $��24(�6@   $��
707,48,0,0q�6N   $	��Top=�6b   $	��133��6z   $��43��6�   .@�5F      �� $	��Jan��6   �� 5G      $	��Feb��6   �� 5H      $	��Mar��6   �� 5I      $	��Apr��6   �� 5J      $	��May��6   �� 5K      $	��Jun��6   �� 5L      $	��Jul��6   �� 5M      $	��Aug��6   �� 5N      $	��Sep��6   �� 5O      $	��Oct��6   �� 5P      $	��Nov��6   �� 5Q      $	��Dec��6   5R      �� 5S   
   -   5        $ label1_Copy8��5S      $
��Year��6&   
�������$
��Left=�6H   $��878,0,-26,0q�6c   $	��Top=�6x   $	��192��6�   $��22(�6�   �� 5T   
   -   5        $ 
extInLabel��5T      $��Expected Time In:��6$   
��� ���$
��Left=�6T   $��707,109,0,0q�6o   $	��Top=�6�   $	��327��6�   $��22(�6�   �� 5U   
   -   5        $ extOutLabel��5U      $��Expected Time Out:��6%   
��� ���$
��Left=�6V   $��707,148,0,0q�6q   $	��Top=�6�   $	��327��6�   $��22(�6�   �� 5V   
   -   5         ��Name$ yearTB��5V      $
��Left=�6"   $��24(�6=   $��43��6K   $��
862,48,0,0q�6W    �� TextWrapping$
 Wrap=�6k   $
��2023��6   $	��Top=�6�   $��63��6�   �� 5W   
   -   5        $ button��5W      $��24(�6!   $��Change��6/   $��Center=�6@   $��
942,48,0,0q�6]   $	��Top=�6q   $��92��6�   $��43��6�   6�   �� 5X   
   -   5        $ rateTB��5X      $
��Left=�6"   $��24(�6=   $��43��6K   $��861,454,0,0q�6W   $
 Wrap=�6�   $��2��6�   $	��Top=�6�   $��64��6�   �� 5Y   
   -   5        $ otBonusLabel_Copy��5Y      $��@��6+   
�������$
��Left=�6J   $��828,452,0,0q�6e   $	��Top=�6z   $��33��6�   $��22(�6�   �� 5Z   
   -   5        $ otBonusLabel_Copy1��5Z      $��per hour��6,   
�������$
��Left=�6R   $��925,452,0,0q�6m   $	��Top=�6�   $	��109��6�   $��22(�6�   5[      5\      
   M S B A M L   `   `   `  ���� V  RPatient Observations System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:Patient_Observations_SystemPatient_Observations_System  (    "Patient_Observations_System.Report   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     ;local)clr-namespace:Patient_Observations_System     -     � Title$  Report��$	��700��$
��1050�� � 
ResizeMode$ CanMinimize=� � 	Resources    BorderGapMaskConverter  GroupBoxStyleRounded �� 
TargetType �� Property �� Value �� 
TargetType J� SnapsToDevicePixels � ColumnDefinitions	 � RowDefinitions
 �� CornerRadius J� OpacityMask `� ConverterParameter `� 	Converter �� ElementName �� Path �� RelativeSource ��Name �� Padding��%�  &	        &	      7   �� �� " ��.���  � �� �#D5DFE5��  � ��$ 1q���  � �� �� " ��.R��  .  �� $��6 ��� $
��Auto ��� $��* ��� $��6 �	 �� $
��Auto ��� $
��Auto ��� $��* ��� $��6 �.+��� 
������ #��z��#��z��$��4��$��0��$
 4��$��1��$��3���� 
�������#��z��$��4��$
 10��$��1��$��3�� `� $ 7��8   .1��� $ Header��$ ActualWidth��� $ ActualWidth� �� *Self+�� $ ActualHeight� �� *Self+._��� #��z��#��z��$
 10��._��� 
�������#��z��$
 10���� $ Header��$��1��$ 3,1,3,0q�$��0��$��2��._��� $��Header����. # z �� $��2��$��1��#��z��$��2��# z .��� ���	#FF333337.+��� -    ��Name$ groupBox��$��Employee Report��$
��Left=�$��	10,10,0,0q�$	��Top=�$	��632��$	��665�����	#FFE0D514$��24(�#���  ���	#FF3F3F46 K� ZIndex$ -1�����	#FFE0D514$��Italic$�.��&   System.Windows.Controls.DataGrid  -     Name$ dataGrid��$
��Left=�$��
10,58,-2,0q�$	��Top=�$	��525��$	��627���� -    ��Name$ headingLabel��$!��Chamisa Nelson April Report��$
��Left=�$��	31,48,0,0q�$	��Top=�$��Italic$�$��25(�$��Segoe UI Semibold)�
�������$	��596���� -   $ label1��$��Total Late Hours:��
�������$
��Left=�$��707,214,0,0q�$	��Top=�$	��192��$��22(��� -   $ lateHrsLabel��$��x Hours��
�������$
��Left=�$��707,258,0,0q�$	��Top=�$	��192��$��22(��� -   $ label1_Copy1��$��Total Overtime Hours:��
�������$
��Left=�$��707,300,0,0q�$	��Top=�$	��238��$��22(��� -   $ 
otHrsLabel��$��x Hours��
�������$
��Left=�$��707,344,0,0q�$	��Top=�$	��192��$��22(��� -	   $ label1_Copy3��$��Overtime Bonus (USD$)��
�������$
��Left=�$��707,408,0,0q�$	��Top=�$	��284��$��22(��� -
   $ otBonusLabel��$
��x.XX��
�������$
��Left=�$��707,452,0,0q�$	��Top=�$��87��$��22(��� -   $ label1_Copy5��$��
Late Flags��
�������$
��Left=�$��707,502,0,0q�$	��Top=�$	��238��$��22(��� -   $ 	lateLabel��$��x��
�������$
��Left=�$��707,546,0,0q�$	��Top=�$	��192��$��22(��� -    ��Name$ btnBack��$
��Back��$
��Left=�$��680,608,0,0q�$	��Top=�$	��160��$��47��$��24(��� -   $ btnHome��$
��Home��$
��Left=�$��878,608,0,0q�$	��Top=�$	��156��$��47��$��24(��� -   $ label1_Copy7��$��Month��
�������$
��Left=�$��	707,0,0,0q�$	��Top=�$	��192��$��22(��� -    ��Name$ comboBox��$
��Left=�$��24(�$��
707,48,0,0q�$	��Top=�$	��133��$��43��.@��� $	��Jan���� $	��Feb���� $	��Mar���� $	��Apr���� $	��May���� $	��Jun���� $	��Jul���� $	��Aug���� $	��Sep���� $	��Oct���� $	��Nov���� $	��Dec���� -   $ label1_Copy8��$
��Year��
�������$
��Left=�$��878,0,-26,0q�$	��Top=�$	��192��$��22(��� -   $ 
extInLabel��$��Expected Time In:��
��� ���$
��Left=�$��707,109,0,0q�$	��Top=�$	��327��$��22(��� -   $ extOutLabel��$��Expected Time Out:��
��� ���$
��Left=�$��707,148,0,0q�$	��Top=�$	��327��$��22(��� -    ��Name$ yearTB��$
��Left=�$��24(�$��43��$��
862,48,0,0q� �� TextWrapping$
 Wrap=�$
��2023��$	��Top=�$��63���� -   $ button��$��24(�$��Change��$��Center=�$��
942,48,0,0q�$	��Top=�$��92��$��43���� -   $ rateTB��$
��Left=�$��24(�$��43��$��861,454,0,0q�$
 Wrap=�$��2��$	��Top=�$��64���� -   $ otBonusLabel_Copy��$��@��
�������$
��Left=�$��828,452,0,0q�$	��Top=�$��33��$��22(��� -   $ otBonusLabel_Copy1��$��per hour��
�������$
��Left=�$��925,452,0,0q�$	��Top=�$	��109��$��22(�
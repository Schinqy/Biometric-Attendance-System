   M S B A M L   `   `   `  ���� V  RPatient Observations System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:Patient_Observations_SystemPatient_Observations_System  )    #Patient_Observations_System.Records   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     ;local)clr-namespace:Patient_Observations_System       � Title$  Records��$	��700��$
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
 10���� $ Header��$��1��$ 3,1,3,0q�$��0��$��2��._��� $��Header����. # z �� $��2��$��1��#��z��$��2��# z .��� -   ���	#FF333337.+�&   System.Windows.Controls.DataGrid  -   $��dataGrid��   AutoGenerateColumns . $��34,80,349,80q����	#FF3F3F46   CanUserResizeRows .  ���� $ LoadDataBinding�   Columns �� -    ��Name$ btnBack��$
��Back��$
��Left=�$��
34,614,0,0q�$	��Top=�$	��188��$��47��$��24(��� -   $ 
btnConnect��$��Connect��$
��Left=�$��
827,94,0,0q�$	��Top=�$	��188��$��47��$��24(��� -   $ 	btnUpdate��$��Update��$
��Left=�$��776,612,0,0q�$	��Top=�$	��188��$��47��$��24(��� -   $ 	btnDelete��$��Delete��$
��Left=�$��522,612,0,0q�$	��Top=�$	��188��$��47��$��24(��� -    ��Name$ comboBox��$
��Left=�$��
827,34,0,0q�$	��Top=�$	��188��$��47���� -    ��Name$ label��$��Search By Surname��$
��Left=�$��	34,10,0,0q�$	��Top=�
�������$��24(��� -	    ��Name$ textBox��$
��Left=�$��41��$��
270,10,0,0q� �� TextWrapping$
 Wrap=�$�� ��$	��Top=�$	��202��$��24(� �� TextAlignment$ Center=��� -
   $ 
label_Copy��$
��Name��$
��Left=�$��741,202,0,0q�$	��Top=�$��39��$��78��$��24(�
��������� -   $ label_Copy1��$��Surname��$
��Left=�$��741,245,0,0q�$	��Top=�$��40��$	��110��$��24(�
��������� -   $ label_Copy2��$	��Sex��$
��Left=�$��741,288,0,0q�$	��Top=�$��40��$��78��$��24(�
��������� -   $ label_Copy3��$��D.O.B��$
��Left=�$��741,331,0,0q�$	��Top=�$��40��$	��101��$��24(�
��������� -   $ label_Copy4��$��	ID Number��$
��Left=�$��741,375,0,0q�$	��Top=�$��40��$	��131��$��24(�
��������� -   $ nameTB��$
��Left=�$��32��$��877,202,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��145��$��24(�$ Center=��� -   $ 	surnameTB��$
��Left=�$��32��$��877,248,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��145��$��24(�$ Center=��� -   $ sexTB��$
��Left=�$��32��$��877,296,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��145��$��24(�$ Center=��� -   $ dobTB��$
��Left=�$��32��$��877,339,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��145��$��24(�$ Center=��� -   $
 idTB��$
��Left=�$��62��$��877,382,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��145��$��24(�$ Center=��� -    ��Name$ groupBox��$��Employee Details��$
��Left=�$��731,151,0,0q�$	��Top=�$	��440��$	��301�����	#FFE0D514$��24(�#���  ���	#FF3F3F46 K� ZIndex$ -1�����	#FFE0D514$��Italic$�.���� -   $ label_Copy5��$	��Dpt��$
��Left=�$��	0,266,0,0q�$	��Top=�$��40��$	��101��$��24(�
�������$��Normal$��� -   $ groupBox_Copy��$��Settings��$
��Left=�$��	743,0,0,0q�$	��Top=�$	��151��$	��291�����	#FFE0D514$��24(�#���  ���	#FF3F3F46$ -1�����	#FFE0D514$��Italic$��� -   $ btnHome��$
��Home��$
��Left=�$��272,612,0,0q�$	��Top=�$	��188��$��47��$��24(��� -   $ dptTB��$
��Left=�$��32��$��877,458,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��145��$��24(�$ Center=��� -   $ timeinTB��$
��Left=�$��32��$��877,503,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��145��$��24(�$ Center=��� -   $ 	timeoutTB��$
��Left=�$��32��$��877,548,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��145��$��24(�$ Center=��� -   $ label_Copy6��$��Time In��$
��Left=�$��737,496,0,0q�$	��Top=�$��40��$	��101��$��24(�
�������$��Normal$��� -   $ label_Copy7��$��Time Out��$
��Left=�$��737,542,0,0q�$	��Top=�$��40��$	��114��$��24(�
�������$��Normal$��� -   $ 	btnReport��$��
Get Report��$
��Left=�$��
522,10,0,0q�$	��Top=�$	��188��$��47��$��24(��� -   $ fingerLabel��$	��---��$
��Left=�$��984,630,0,0q�$	��Top=�
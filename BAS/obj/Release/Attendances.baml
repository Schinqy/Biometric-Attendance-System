   M S B A M L   `   `   `  ���� V  RPatient Observations System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:Patient_Observations_SystemPatient_Observations_System  -    'Patient_Observations_System.Attendances   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     ;local)clr-namespace:Patient_Observations_System     -     � Title$  
Attendance��$	��700��$
��1050��
������� � 
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
 10���� $ Header��$��1��$ 3,1,3,0q�$��0��$��2��._��� $��Header����. # z �� $��2��$��1��#��z��$��2��# z .��� ���	#FF333337.+��� -    ��Name$ label��$
��Name��$
��Left=�$��24.5,78,0,0q�$	��Top=�$��58��$	��114��$��24(�
��������� -   $ 
label_Copy��$��Surname��$
��Left=�$��24.5,134,0,0q�$	��Top=�$��58��$	��148��$��24(�
��������� -   $ label_Copy1��$	��Sex��$
��Left=�$��24.5,200,0,0q�$	��Top=�$��58��$	��114��$��24(�
��������� -   $ label_Copy2��$��D.O.B��$
��Left=�$��24.5,328,0,0q�$	��Top=�$��58��$	��148��$��24(�
��������� -   $ label_Copy4��$��	ID Number��$
��Left=�$��24.5,265,0,0q�$	��Top=�$��58��$	��168��$��24(�
��������� -    ��Name$ nameTB��$
��Left=�$��37��$��
223,78,0,0q� �� TextWrapping$
 Wrap=�$�� ��$	��Top=�$	��212��$��24(� �� TextAlignment$ Center=��� -   $ 	surnameTB��$
��Left=�$��37��$��223,134,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��212��$��24(�$ Center=��� -	   $
 idTB��$
��Left=�$��37��$��223,265,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��252��$��24(�$ Center=��� -
    ��Name$ comboBox��$
��Left=�$��
735,82,0,0q�$	��Top=�$	��188��$��47��$��24(��� -   $ label_Copy5��$��COM Port��$
��Left=�$��
731,47,0,0q�$	��Top=�$��58��$	��188��$��24(�
��������� -    ��Name$ groupBox��$��Employee Details��$
��Left=�$��	10,37,0,0q�$	��Top=�$	��565��$	��482�����	#FFE0D514$��24(�#���  ���	#FF3F3F46 K� ZIndex$ -1�����	#FFE0D514$��Italic$��� -   $ groupBox_Copy��$��Settings��$
��Left=�$��
557,10,0,0q�$	��Top=�$	��213��$	��432�����	#FFE0D514$��24(�#���  ���	#FF3F3F46$ -1�����	#FFE0D514$��Italic$�.���� -    ��Name$ 
btnConnect��$��Connect��$
��Left=�$��173,114,0,0q�$	��Top=�$	��188��$��47��$��Normal$��� -   $ 
btnCollect��$��Get Attendance��$
��Left=�$��800,495,0,0q�$	��Top=�$	��233��$��89��$��32(� �� 	IsDefault . ���� " ��.R��� $
 10��
����ح�._��� $��Center=�$��Center=��� -   $ btnBack��$
��Back��$
��Left=�$��629,612,0,0q�$	��Top=�$	��188��$��47��$��24(��� -   $ btnHome��$
��Home��$
��Left=�$��845,612,0,0q�$	��Top=�$	��188��$��47��$��24(� J� RenderTransformOrigin$ 1.505,-2.043&��� -   $ groupBox_Copy1��$��Status��$
��Left=�$��557,230,0,0q�$	��Top=�$	��243��$	��432�����	#FFE0D514$��24(�#���  ���	#FF3F3F46$ -1�����	#FFE0D514$��Italic$�.���� -   $ label2��$	��...��$
��Left=�$��	67,26,0,0q�$	��Top=��� -   $ sexCB��$
��Left=�$��223,200,0,0q�$	��Top=�$��90��$��37��$��24(�.@��� $��M���� $��F���� $��NB���� $��O���� -    ��Name$ richTextBox��$
��Left=�$	��100��$��523,484,0,0q�$	��Top=�$	��244��$��16(�. �/� �� -   $ label_Copy3��$��
Department��$
��Left=�$��24.5,395,0,0q�$	��Top=�$��58��$	��168��$��24(�
��������� -   $ dptTB��$
��Left=�$��37��$��223,395,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��252��$��24(�$ Center=��� -   $ label_Copy6��$��	Finger ID��$
��Left=�$��223,542,0,0q�$	��Top=�$��58��$	��110��$��24(�
��������� -   $ fingerTB��$
��Left=�$��37��$��223,500,0,0q�$
 Wrap=�$�� ��$	��Top=�$��90��$��24(�$ Center=��� -   $ label1��$	��...��$
��Left=�$��629,344,0,0q�$	��Top=�$��24(�$��Italic$��� -   $ statusLabel��$	��...��$
��Left=�$��
58,612,0,0q�$	��Top=�$	��275��$��24(��� -   $ dobTB��$
��Left=�$��37��$��223,328,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��252��$��24(�$ Center=�
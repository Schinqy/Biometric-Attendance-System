   M S B A M L   `   `   `  ���� V  RPatient Observations System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:Patient_Observations_SystemPatient_Observations_System  M ISystem, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089A-clr-namespace:System.IO.Ports;assembly=SystemSystem.IO.Ports *    $Patient_Observations_System.Register   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     ;local)clr-namespace:Patient_Observations_System     ?ports-clr-namespace:System.IO.Ports;assembly=System     -     � Title$  Register��$	��700��$
��1050��
������� � 
ResizeMode$ CanMinimize=� � 	Resources    System.IO.Ports.SerialPort   ComPort  BorderGapMaskConverter  GroupBoxStyleRounded �� 
TargetType �� Property �� Value �� 
TargetType J� SnapsToDevicePixels � ColumnDefinitions	 � RowDefinitions
 �� CornerRadius J� OpacityMask `� ConverterParameter `� 	Converter �� ElementName �� Path �� RelativeSource ��Name �� Padding��%�  &	        &	 
     &	      7    -   �� �� " ��.���  � �� �#D5DFE5��  � ��$ 1q���  � �� �� " ��.R��  .  �� $��6 ��� $
��Auto ��� $��* ��� $��6 �	 �� $
��Auto ��� $
��Auto ��� $��* ��� $��6 �.+��� 
������ #��z��#��z��$��4��$��0��$
 4��$��1��$��3���� 
�������#��z��$��4��$
 10��$��1��$��3�� `� $ 7��8   .1��� $ Header��$ ActualWidth��� $ ActualWidth� �� *Self+�� $ ActualHeight� �� *Self+._��� #��z��#��z��$
 10��._��� 
�������#��z��$
 10���� $ Header��$��1��$ 3,1,3,0q�$��0��$��2��._��� $��Header����. # z �� $��2��$��1��#��z��$��2��# z .��� ���	#FF333337 �� $	��20* ��� $	��58* ��� $
��967* �	 �� .+��� -    ��Name$ label��$
��Name��$
��Left=�$��
4.5,78,0,0q�$	��Top=�$��58��$	��114��$��24(�
�������$��2��$��1���� -   $ 
label_Copy��$��Surname��$
��Left=�$��4.5,134,0,0q�$	��Top=�$��58��$	��148��$��24(�
�������$��2��$��1���� -   $ label_Copy1��$	��Sex��$
��Left=�$��4.5,200,0,0q�$	��Top=�$��58��$	��114��$��24(�
�������$��2��$��1���� -   $ label_Copy2��$��D.O.B��$
��Left=�$��4.5,328,0,0q�$	��Top=�$��58��$	��148��$��24(�
�������$��2��$��1���� -   $ label_Copy4��$��	ID Number��$
��Left=�$��4.5,265,0,0q�$	��Top=�$��58��$	��168��$��24(�
�������$��2��$��1���� -    ��Name$ nameTB��$
��Left=�$��37��$��
145,78,0,0q� �� TextWrapping$
 Wrap=�$�� ��$	��Top=�$	��212��$��24(� �� TextAlignment$ Center=�$��2���� -	   $ 	surnameTB��$
��Left=�$��37��$��145,134,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��212��$��24(�$ Center=�$��2���� -
   $
 idTB��$
��Left=�$��37��$��145,265,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��252��$��24(�$ Center=�$��2���� -    ��Name$ comboBox��$
��Left=�$��
657,82,0,0q�$	��Top=�$	��188��$��47��$��24(�$��2���� -   $ label_Copy5��$��COM Port��$
��Left=�$��
653,47,0,0q�$	��Top=�$��58��$	��188��$��24(�
�������$��2���� -    ��Name$ groupBox��$��Employee Details��$
��Left=�$��	10,37,0,0q�$	��Top=�$	��565��$	��482�����	#FFE0D514$��24(�#���  ���	#FF3F3F46 K� ZIndex$ -1�����	#FFE0D514$��Italic$�$��3��.��(  "System.Windows.Controls.DatePicker  -     Name$ 
datePicker��$
��Left=�$��204,260,0,0q�$	��Top=�   SelectedDate �� *PropertyName+ �� StringFormat$ 
yyyy/MM/dd���� -   $ groupBox_Copy��$��Settings��$
��Left=�$��
479,10,0,0q�$	��Top=�$	��213��$	��432�����	#FFE0D514$��24(�#���  ���	#FF3F3F46$ -1�����	#FFE0D514$��Italic$�$��2��.���� -    ��Name$ 
btnConnect��$��Connect��$
��Left=�$��173,114,0,0q�$	��Top=�$	��188��$��47��$��Normal$��� -   $ 
btnCollect��$��Register��$
��Left=�$��767,495,0,0q�$	��Top=�$	��188��$��89��$��32(�$��2������ " ��.R��� $
 10��
����ح�._��� $��Center=�$��Center=��� -   $ btnBack��$
��Back��$
��Left=�$��551,612,0,0q�$	��Top=�$	��188��$��47��$��24(�$��2���� -   $ btnHome��$
��Home��$
��Left=�$��767,612,0,0q�$	��Top=�$	��188��$��47��$��24(� J� RenderTransformOrigin$ 1.505,-2.043&�$��2���� -   $ groupBox_Copy1��$��Enrolment Status��$
��Left=�$��479,230,0,0q�$	��Top=�$	��243��$	��432�����	#FFE0D514$��24(�#���  ���	#FF3F3F46$ -1�����	#FFE0D514$��Italic$�$��2��.���� -   $ label2��$	��...��$
��Left=�$��	67,26,0,0q�$	��Top=��� -   $ sexCB��$
��Left=�$��145,200,0,0q�$	��Top=�$��90��$��37��$��24(�$��2��.@��� $��M���� $��F���� $��NB���� $��O���� -    ��Name$ richTextBox��$
��Left=�$	��100��$��445,484,0,0q�$	��Top=�$	��294��$��16(�$��2��. �/� �� -   $ label_Copy3��$��
Department��$
��Left=�$��4.5,395,0,0q�$	��Top=�$��58��$	��168��$��24(�
�������$��2��$��1���� -   $ dptTB��$
��Left=�$��37��$��145,395,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��252��$��24(�$ Center=�$��2���� -   $ label_Copy6��$��	Finger ID��$
��Left=�$��145,542,0,0q�$	��Top=�$��58��$	��110��$��24(�
�������$��2���� -   $ fingerTB��$
��Left=�$��37��$��145,500,0,0q�$
 Wrap=�$�� ��$	��Top=�$��90��$��24(�$ Center=�$��2���� -   $ label1��$	��...��$
��Left=�$��551,344,0,0q�$	��Top=�$��2��$��24(�$��Italic$��� -   $ statusLabel��$	��...��$
��Left=�$��
38,612,0,0q�$	��Top=�$��1��$��2��$	��322��$��24(�
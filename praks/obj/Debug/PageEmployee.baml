   M S B A M L   `   `   `  ����@  <praks, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:praks.ListTitlepraks.ListTitle  5      ?$clr-namespace:praks_validation_rulespraks_validation_rules  5      7 clr-namespace:praks.DataCommandspraks.DataCommands  5      clr-namespace:prakspraks  5	          praks.PageEmployee   5      &coreclr-namespace:praks.ListTitle  5      -rule$clr-namespace:praks_validation_rules  5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      4command clr-namespace:praks.DataCommands     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      %localclr-namespace:praks     5	      -   5          N� Title$  PageEmployee��5       � 	Resources 5         DatеTemplate �� StringFormat  EditingDateTemplate(  "System.Windows.Controls.DatePicker   SelectedDate �� Mode �� UpdateSourceTrigger  
errorStyle �� 
TargetType �� Property �� Value	 �� Triggers
 P� Property P� Value �� RelativeSource �� Path��%o  &	        &	 �     &	     �� 5   
   .R�5      �� $��Center=�5      $��Center=�6'   ��5      �� *	BirthDate+$ {0:dd.}{0:MM.}{0:yyyy}��5   F   5      �� 5   
   .R�5         6   �� *	BirthDate+$ TwoWay=�$ PropertyChanged=�6r   5      �� 5   
   " ��6#   .�5      ��  � ��$ -2q�6(   65   	 5      P� 5      
 �@=�HasError . . �5       ��  � ��
 �  ��6A   �� 5!       � ��$ 1q�68   6D   �� 5"       �@�ToolTip 5#      ��  �� *Self+$) #(Validation.Errors)[0].ErrorContent�5$   K   5%      5'      5(      .��5+      ��   BackgroundWindowResource#��[ 6   $��3,3,-497,-14q�6H   .+�5-   
   o� .@�5.      m� $��Действие��6   .@�5/      m� $��Отменить��6    m� Command$
 Undo��6/   6A   �� 50      6   m� 51      $��Создать��6   $	 New��6-   6>   m� 52      $ ��Редактировать��6   $ command:DataCommands.Edit��63   6Z   m� 53      $��Сохранить��6   $
 Save��6/   6A   m� 54      $��
Найти��6   $
 Find��6+   6=   �� 55      6   m� 56      $��Удалить��6   $! command:DataCommands.Delete��6-   6V   57      m� 58      $��
Отчет��6   6(   59      c� 5:   
   .@�5;      �� -   5         ��Name$
 Undo��5;      $
��Undo��6#    � ToolTip$D >Отменить редактирование/создание��63   $��5,2,5,2q�6^   .��5<      �� $ ��A:\progs\pictures\undo.png��6   $��25��6<   $��25��6H   6U   5=      �� 5>      -   5        $	 New��5>      $	��New��6"   $ Добавить��61   $��5,2,5,2q�6D   .��5?      �� $��A:\progs\pictures\add.png��6   $��25��6;   $��25��6G   6T   5@      �� 5A      -   5        $
 Edit��5A      $��command:DataCommands.Edit��6#   $  Редактировать��6H   $��5,2,5,2q�6`   .��5B      �� $ ��A:\progs\pictures\edit.png��6   $��25��6<   $��25��6H   6U   5C      �� 5D      -   5        $
 Find��5D      $
��Find��6#   $ 
Поиск��63   $��5,2,5,2q�6C   .��5E      �� $ ��A:\progs\pictures\find.png��6   $��25��6<   $��25��6H   6U   5F      �� 5G      -   5        $
 Save��5G      $
��Save��6#   $ Сохранить��63   $��5,2,5,2q�6G   .��5H      �� $ ��A:\progs\pictures\save.png��6   $��25��6<   $��25��6H   6U   5I      �� 5J      -   5        $ Delete��5J      $!��command:DataCommands.Delete��6%   $ Удалить��6L   $��5,2,5,2q�6^   .��5K      �� $"��A:\progs\pictures\cancel.png��6   $��25��6>   $��25��6J   6W   5L      5M      �� 5N   
   $��5q�6   %#Список сотрудников63   &   System.Windows.Controls.DataGrid  5O   
   -   5          Name$ DataGridEmployee��5O         AutoGenerateColumns .  $
��Left=�5R      $
��1000��5S      $	��295��5T         RowBackground �	#FF1F33EB   AlternatingRowBackground �	#FC96CFD4���	#FF1F33EB$��3q�5X         	RowHeight$ 25Q�5Y       � Cursor$
 Hand��5Z         CanUserAddRows .     CanUserDeleteRows .  $	��985��5]      ��5P      �� !   RowValidationErrorTemplate 5_      �� 5`      .R�5a      � $��	0,-2,0,-2q�6    5b      ��  �� *FindAncestor+ �� AncestorType)  #System.Windows.Controls.DataGridRow"  $) #(Validation.Errors)[0].ErrorContent�.+�5d      A� $��0��6"   
���  ��#��z��6A   #��z��5e   "   6H   �� 5f      $��!��6$   #��z��6-   $
��Bold"�6S   
�������$��Center=�5g   7   6V   5i      5j         Columns 5l      0  *System.Windows.Controls.DataGridTextColumn  5m      ,  &System.Windows.Controls.DataGridColumn   Header$ Фамилия��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 66   �� *	Surname+$ TwoWay=�$ PropertyChanged=�6�     5n      $ Имя��6%    62   �� *Name+$ TwoWay=�$ PropertyChanged=�6     5o      $ Отчество��6%    67   �� *
Patronymic+$ TwoWay=�$ PropertyChanged=�6�   4  .System.Windows.Controls.DataGridComboBoxColumn  5p      $ Должность��6)      DisplayMemberPath$ Title1��5r   )      SelectedValuePath$ ID��5t   )       ItemsSource  5q   )   ��   	listTitle! �� Source#! [ "   SelectedValueBinding" 5s   )   �� $ TitleId�$ TwoWay=�$ PropertyChanged=�5t   C   4  .System.Windows.Controls.DataGridTemplateColumn  5u      $ Дата рождения��6)   #   CellTemplate## [  5v   )   $   CellEditingTemplate#$ [ 5w   )   6g     5x      $ Телефон��6%    66   �� *	Telephone+$ TwoWay=�$ PropertyChanged=�6�     5y      $' !Электронная почта��6%   %   EditingElementStyle#% [ 6@    5z      �� 5{      $ Email�6"   $ TwoWay=�6/   $ PropertyChanged=�6=   & �� ValidatesOnExceptions& . ' �� ValidationRules' 5|      &	   praks_validation_rules.EmailRule	  5}   "   63   5      5�      5�      5�      ( J� CommandBindings( 5�      )
  #System.Windows.Input.CommandBinding
  5�   
   -	   5        %  praks.DataCommands.DataCommands)   Edit* 
  Command#* Z) 5�      5�      
  5�   
   -
   5        +   Delete#* Z+ 5�      5�      
  5�   
   -   5        $
* Undo��5�      5�      
  5�   
   -   5        $
* Save��5�      5�      
  5�   
   -   5        $
* Find��5�      5�      
  5�   
   -   5        $	* New��5�      5�      5�      
FasdUAS 1.101.10   ��   ��    k             l     ��  ��     create by LB     � 	 	  c r e a t e   b y   L B   
  
 l     ��������  ��  ��        l     ��  ��    &  �����ı��ļ�·�� ��ʽ������-����     �   "��Qee�g,e�N���_�  h<_�Y�T -��{�      l     ��  ��    e _set something to display dialog "������txt�ı����ƣ�txt���ݸ�ʽΪ������-����" default answer ""     �   � s e t   s o m e t h i n g   t o   d i s p l a y   d i a l o g   "����Qe t x te�g,Ty�� t x tQ�[�h<_N:�Y�T -��{� "   d e f a u l t   a n s w e r   " "      l     ��  ��    4 .set textReturned to text returned of something     �   \ s e t   t e x t R e t u r n e d   t o   t e x t   r e t u r n e d   o f   s o m e t h i n g      l     ��������  ��  ��        l     ��   ��    , &if the length of textReturned > 0 then      � ! ! L i f   t h e   l e n g t h   o f   t e x t R e t u r n e d   >   0   t h e n   " # " l     ��������  ��  ��   #  $ % $ l     �� & '��   &  set listOfShows to {}    ' � ( ( * s e t   l i s t O f S h o w s   t o   { } %  ) * ) l     �� + ,��   +  set dataRecord to {}    , � - - ( s e t   d a t a R e c o r d   t o   { } *  . / . l     �� 0 1��   0 b \set Shows to paragraphs of (read POSIX file ("/Users/lb/Desktop/" & textReturned & ".text"))    1 � 2 2 � s e t   S h o w s   t o   p a r a g r a p h s   o f   ( r e a d   P O S I X   f i l e   ( " / U s e r s / l b / D e s k t o p / "   &   t e x t R e t u r n e d   &   " . t e x t " ) ) /  3 4 3 l     �� 5 6��   5 + %set fileName to textReturned & ".txt"    6 � 7 7 J s e t   f i l e N a m e   t o   t e x t R e t u r n e d   &   " . t x t " 4  8 9 8 l     �� : ;��   : 1 +(path to desktop as text) & "contacts2.txt"    ; � < < V ( p a t h   t o   d e s k t o p   a s   t e x t )   &   " c o n t a c t s 2 . t x t " 9  = > = l     �� ? @��   ? < 6set milefile to ((path to desktop as text) & fileName)    @ � A A l s e t   m i l e f i l e   t o   ( ( p a t h   t o   d e s k t o p   a s   t e x t )   &   f i l e N a m e ) >  B C B l     �� D E��   D 5 /set Shows to paragraphs of (read file milefile)    E � F F ^ s e t   S h o w s   t o   p a r a g r a p h s   o f   ( r e a d   f i l e   m i l e f i l e ) C  G H G l     �� I J��   I ' !set Shows to (read file milefile)    J � K K B s e t   S h o w s   t o   ( r e a d   f i l e   m i l e f i l e ) H  L M L l     �� N O��   N   set the clipboard to Shows    O � P P 4 s e t   t h e   c l i p b o a r d   t o   S h o w s M  Q R Q l     �� S T��   S # repeat with nextLine in Shows    T � U U : r e p e a t   w i t h   n e x t L i n e   i n   S h o w s R  V W V l     �� X Y��   X 0 *set resultArray to theSplit(nextLine, "-")    Y � Z Z T s e t   r e s u l t A r r a y   t o   t h e S p l i t ( n e x t L i n e ,   " - " ) W  [ \ [ l     �� ] ^��   ]  addContacts(resultArray)    ^ � _ _ 0 a d d C o n t a c t s ( r e s u l t A r r a y ) \  ` a ` l     �� b c��   b  
end repeat    c � d d  e n d   r e p e a t a  e f e l     �� g h��   g 
 ����    h � i i e�S� f  j k j l     l���� l I     �������� 0 addcanledar addCanledar��  ��  ��  ��   k  m n m l     ��������  ��  ��   n  o p o l     �� q r��   q 
 else    r � s s  e l s e p  t u t l     �� v w��   v ) #display dialog "�������ı��ļ�����"    w � x x 4 d i s p l a y   d i a l o g   "����Qee�g,e�N�Ty� " u  y z y l     �� { |��   {  end if    | � } }  e n d   i f z  ~  ~ l     ��������  ��  ��     � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �  add contacts func    � � � � " a d d   c o n t a c t s   f u n c �  � � � i      � � � I      �� ����� 0 addcontacts addContacts �  ��� � o      ���� 0 thearray theArray��  ��   � O     @ � � � k    ? � �  � � � r    
 � � � n     � � � 4    �� �
�� 
cobj � m    ����  � o    ���� 0 thearray theArray � o      ���� 0 thename theName �  � � � r     � � � n     � � � 4    �� �
�� 
cobj � m    ����  � o    ���� 0 thearray theArray � o      ���� 0 theemail theEmail �  � � � r      � � � I   ���� �
�� .corecrel****      � null��   � �� � �
�� 
kocl � m    ��
�� 
azf4 � �� ���
�� 
prdt � K     � � �� ���
�� 
azf7 � o    ���� 0 thename theName��  ��   � o      ���� 0 	theperson 	thePerson �  � � � O   ! 9 � � � I  % 8���� �
�� .corecrel****      � null��   � �� � �
�� 
kocl � m   ' (��
�� 
az21 � �� � �
�� 
insh � n   ) - � � �  ;   , - � n   ) , � � � 2  * ,��
�� 
az21 � o   ) *���� 0 	theperson 	thePerson � �� ���
�� 
prdt � K   . 4 � � �� � �
�� 
az18 � m   / 0 � � � � � [�^� � �� ���
�� 
az17 � o   1 2���� 0 theemail theEmail��  ��   � o   ! "���� 0 	theperson 	thePerson �  ��� � I  : ?������
�� .coresavenull���     null��  ��  ��   � m      � ��                                                                                  adrb  alis    V  Macintosh HD               �QH+     GContacts.app                                                     �Ѫ�>        ����  	                Applications    �P��      ѪN�       G  'Macintosh HD:Applications: Contacts.app     C o n t a c t s . a p p    M a c i n t o s h   H D  Applications/Contacts.app   / ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �  sperect string func    � � � � & s p e r e c t   s t r i n g   f u n c �  � � � i     � � � I      �� ����� 0 thesplit theSplit �  � � � o      ���� 0 	thestring 	theString �  ��� � o      ���� 0 thedelimiter theDelimiter��  ��   � k      � �  � � � l     �� � ���   � . ( save delimiters to restore old settings    � � � � P   s a v e   d e l i m i t e r s   t o   r e s t o r e   o l d   s e t t i n g s �  � � � r      � � � n     � � � 1    ��
�� 
txdl � 1     ��
�� 
ascr � o      ���� 0 olddelimiters oldDelimiters �  � � � r     � � � o    ���� 0 thedelimiter theDelimiter � n      � � � 1    
��
�� 
txdl � 1    ��
�� 
ascr �  � � � l   �� � ���   �   create the array    � � � � "   c r e a t e   t h e   a r r a y �  � � � r     � � � n     � � � 2    ��
�� 
citm � o    ���� 0 	thestring 	theString � o      ���� 0 thearray theArray �  � � � l   �� � ���   �   restore the old setting    � � � � 0   r e s t o r e   t h e   o l d   s e t t i n g �  � � � r     � � � o    ���� 0 olddelimiters oldDelimiters � n      � � � 1    ��
�� 
txdl � 1    ��
�� 
ascr �  � � � l   �� � ��   �   return the result     � $   r e t u r n   t h e   r e s u l t � �� L     o    ���� 0 thearray theArray��   �  l     �������  ��  �    l     �~�}�|�~  �}  �|   	 l     �{�z�y�{  �z  �y  	 

 l     �x�x     addCanledar Func    � "   a d d C a n l e d a r   F u n c  i     I      �w�v�u�w 0 addcanledar addCanledar�v  �u   k     �  l     �t�s�r�t  �s  �r    l     �q�q    create contact group    � ( c r e a t e   c o n t a c t   g r o u p  O      k      !  r    "#" l   	$�p�o$ n    	%&% 1    	�n
�n 
wr02& 2    �m
�m 
wres�p  �o  # o      �l�l &0 allcalendartitles allCalendarTitles! '�k' Z    (�j�i)( E    *+* o    �h�h &0 allcalendartitles allCalendarTitles+ m    ,, �-- [�^��j  �i  ) I   �g�f.
�g .wrbtaec2null��� ��� null�f  . �e/�d
�e 
wtnm/ m    00 �11 [�^��d  �k   m     22�                                                                                  wrbt  alis    V  Macintosh HD               �QH+     GCalendar.app                                                     	G��w4        ����  	                Applications    �P��      ���       G  'Macintosh HD:Applications: Calendar.app     C a l e n d a r . a p p    M a c i n t o s h   H D  Applications/Calendar.app   / ��   343 l   �c�b�a�c  �b  �a  4 565 l   �`78�`  7  
add events   8 �99  a d d   e v e n t s6 :;: r    &<=< l   $>�_�^> I   $�]�\�[
�] .misccurdldt    ��� null�\  �[  �_  �^  = o      �Z�Z 0 thedate theDate; ?@? O   ' �ABA k   + �CC DED I  + 0�Y�X�W
�Y .miscactvnull��� ��� null�X  �W  E F�VF O   1 �GHG k   8 �II JKJ l  8 8�ULM�U  L . (set timeString to time string of theDate   M �NN P s e t   t i m e S t r i n g   t o   t i m e   s t r i n g   o f   t h e D a t eK OPO l  8 8�TQR�T  Q � �set newEvent to make new event at end with properties {description:"ȥ��ȥ", summary:"c����һ�� " & timeString, location:"֣��", start date:theDate + 1 * minutes, end date:theDate + 24 * hours, status:none}   R �SS� s e t   n e w E v e n t   t o   m a k e   n e w   e v e n t   a t   e n d   w i t h   p r o p e r t i e s   { d e s c r i p t i o n : "S�NS� " ,   s u m m a r y : " c���N N   "   &   t i m e S t r i n g ,   l o c a t i o n : "��]� " ,   s t a r t   d a t e : t h e D a t e   +   1   *   m i n u t e s ,   e n d   d a t e : t h e D a t e   +   2 4   *   h o u r s ,   s t a t u s : n o n e }P TUT I  8 =�SV�R
�S .sysodelanull��� ��� nmbrV m   8 9�Q�Q �R  U WXW O   > �YZY O   B �[\[ k   I �]] ^_^ l  I I�P`a�P  ` F @get attribute "AXRoleDescription" of pop over 1 of window "����"   a �bb | g e t   a t t r i b u t e   " A X R o l e D e s c r i p t i o n "   o f   p o p   o v e r   1   o f   w i n d o w   "e�S� "_ cdc O  I Xefe r   M Wghg m   M N�O
�O boovtrueh n      iji 1   R V�N
�N 
pisfj 4   N R�Mk
�M 
prcsk m   P Qll �mm  C a l e n d a rf m   I Jnn�                                                                                  sevs  alis    �  Macintosh HD               �QH+     'System Events.app                                               ����M        ����  	                CoreServices    �P��      ���       '   &   %  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  d opo I  Y ^�Lq�K
�L .sysodelanull��� ��� nmbrq m   Y Z�J�J �K  p rsr I  _ f�It�H
�I .prcskprsnull���     ctxtt 1   _ b�G
�G 
tab �H  s uvu I  g l�Fw�E
�F .sysodelanull��� ��� nmbrw m   g h�D�D �E  v xyx I  m z�Cz{
�C .prcskprsnull���     ctxtz m   m p|| �}}  e{ �B~�A
�B 
faal~ m   s v�@
�@ eMdsKcmd�A  y � Y   { ���?���>� I  � ��=��<
�= .prcskprsnull���     ctxt� 1   � ��;
�; 
tab �<  �? 0 counter  � m   ~ �:�: � m    ��9�9 �>  � ��� I  � ��8��7
�8 .sysodelanull��� ��� nmbr� m   � ��6�6 �7  � ��� I  � ��5��
�5 .prcskprsnull���     ctxt� m   � ��� ���  v� �4��3
�4 
faal� m   � ��2
�2 eMdsKcmd�3  � ��� I  � ��1��0
�1 .sysodelanull��� ��� nmbr� m   � ��/�/ �0  � ��� l  � ��.�-�,�.  �-  �,  � ��� Y   � ���+���*� I  � ��)��(
�) .prcskprsnull���     ctxt� 1   � ��'
�' 
tab �(  �+ 0 counter  � m   � ��&�& � m   � ��%�% �*  � ��� I  � ��$��#
�$ .sysodelanull��� ��� nmbr� m   � ��"�" �#  � ��!� I  � �� ��
�  .prcskprsnull���     ctxt� 1   � ��
� 
spac�  �!  \ 4   B F��
� 
prcs� m   D E�� ���  C a l e n d a rZ m   > ?���                                                                                  sevs  alis    �  Macintosh HD               �QH+     'System Events.app                                               ����M        ����  	                CoreServices    �P��      ���       '   &   %  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  X ��� l  � �����  �  �  �  H 4   1 5��
� 
wres� m   3 4�� ��� [�^��V  B m   ' (���                                                                                  wrbt  alis    V  Macintosh HD               �QH+     GCalendar.app                                                     	G��w4        ����  	                Applications    �P��      ���       G  'Macintosh HD:Applications: Calendar.app     C a l e n d a r . a p p    M a c i n t o s h   H D  Applications/Calendar.app   / ��  @ ��� l  � �����  �  �  �   ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ���
�  �  �
  �       �	������	  � ����� 0 addcontacts addContacts� 0 thesplit theSplit� 0 addcanledar addCanledar
� .aevtoappnull  �   � ****� � ������� 0 addcontacts addContacts� � ��  �  ���� 0 thearray theArray�  � ���������� 0 thearray theArray�� 0 thename theName�� 0 theemail theEmail�� 0 	theperson 	thePerson�  ��������������������� �������
�� 
cobj
�� 
kocl
�� 
azf4
�� 
prdt
�� 
azf7�� 
�� .corecrel****      � null
�� 
az21
�� 
insh
�� 
az18
�� 
az17�� 
�� .coresavenull���     null� A� =��k/E�O��l/E�O*����l� E�O� *����-6������ UO*j U� �� ����������� 0 thesplit theSplit�� ����� �  ������ 0 	thestring 	theString�� 0 thedelimiter theDelimiter��  � ���������� 0 	thestring 	theString�� 0 thedelimiter theDelimiter�� 0 olddelimiters oldDelimiters�� 0 thearray theArray� ������
�� 
ascr
�� 
txdl
�� 
citm�� ��,E�O���,FO��-E�O���,FO�� ������������ 0 addcanledar addCanledar��  ��  � �������� &0 allcalendartitles allCalendarTitles�� 0 thedate theDate�� 0 counter  � 2����,��0���������������l������|�������
�� 
wres
�� 
wr02
�� 
wtnm
�� .wrbtaec2null��� ��� null
�� .misccurdldt    ��� null
�� .miscactvnull��� ��� null�� 
�� .sysodelanull��� ��� nmbr
�� 
prcs
�� 
pisf
�� 
tab 
�� .prcskprsnull���     ctxt
�� 
faal
�� eMdsKcmd
�� 
spac�� �� *�-�,E�O�� hY 	*��l UO*j E�O� �*j O*��/ ��j O� �*��/ �� e*��/a ,FUOmj O_ j Okj Oa a a l O k�kh _ j [OY��Okj Oa a a l Olj O kmkh _ j [OY��Okj O_ j UUOPUUOP� �����������
�� .aevtoappnull  �   � ****� k     ��  j����  ��  ��  �  � ���� 0 addcanledar addCanledar�� *j+  ascr  ��ޭ
function varargout = bodeFinal(varargin)
% BODEFINAL MATLAB code for bodeFinal.fig
%      BODEFINAL, by itself, creates a new BODEFINAL or raises the existing
%      singleton*.
%
%      H = BODEFINAL returns the handle to a new BODEFINAL or the handle to
%      the existing singleton*.
%
%      BODEFINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BODEFINAL.M with the given input arguments.
%
%      BODEFINAL('Property','Value',...) creates a new BODEFINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bodeFinal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bodeFinal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bodeFinal

% Last Modified by GUIDE v2.5 22-Jun-2021 15:03:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bodeFinal_OpeningFcn, ...
                   'gui_OutputFcn',  @bodeFinal_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before bodeFinal is made visible.
function bodeFinal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bodeFinal (see VARARGIN)

set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 1);

title('Bode Diagram','fontweight','bold','fontsize',12,'Parent',handles.axes1);
ylabel('Magnitude(dB)','fontweight','bold','fontsize',10,'Parent',handles.axes1);

ylabel('Phase (degree)','fontweight','bold','fontsize',10,'Parent',handles.axes2);
xlabel('Frequency (rad/s)','fontweight','bold','fontsize',10,'Parent',handles.axes2);

% Choose default command line output for bodeFinal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bodeFinal wait for user response (see UIRESUME)
% uiwait(handles.figure1);




% --- Outputs from this function are returned to the command line.
function varargout = bodeFinal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in plotBode.
function plotBode_Callback(hObject, eventdata, handles)
% hObject    handle to plotBode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

num=str2num(get(handles.numEdit,'string'));
den=str2num(get(handles.denEdit,'string'));
iv=str2num(get(handles.ivEdit,'string'));
fv=str2num(get(handles.fvEdit,'string'));
ns=str2num(get(handles.nsEdit,'string'));

%Choosing color 
fmenucolor=findobj(gcbf,'Tag','colorLinePopMenu');
fseccolor=get(fmenucolor,'Value');

if(fseccolor==1)
    f = msgbox('Color secimi yapmadiniz , varsayilan olarak ayarlandi .'...
    , 'Uyari');
    renk='b';
end
if(fseccolor==2)
    renk='r';
end
if(fseccolor==3)
    renk='b';
end
if(fseccolor==4)
    renk='g';
end

%Choosing line type 
fmenuline=findobj(gcbf,'Tag','colorLinePopMenu');
fsecline=get(fmenuline,'Value');

if(fsecline==1)
    f = msgbox('Line style secimi yapmadiniz , varsayilan olarak ayarlandi .'...
    , 'Uyari');
    linest='-';
end
if(fsecline==2)
    linest='.';
end
if(fsecline==3)
    linest='-';
end
if(fsecline==4)
    linest=':';
end

% Calculation
w=logspace(iv,fv,ns);
h=freqs(num,den,w);
dbh=20*log10(abs(h));
phs=angle(h)*180/pi;

axes(handles.axes1)
semilogx(w,dbh,'Color',renk,'LineStyle',linest,'LineWidth',2.5);

axes(handles.axes2)
semilogx(w,phs,'Color',renk,'LineStyle',linest,'LineWidth',2.5);

title('Bode Diagram','fontweight','bold','fontsize',12,'Parent',handles.axes1);
ylabel('Magnitude(dB)','fontweight','bold','fontsize',10,'Parent',handles.axes1);

ylabel('Phase (degree)','fontweight','bold','fontsize',10,'Parent',handles.axes2);
xlabel('Frequency (rad/s)','fontweight','bold','fontsize',10,'Parent',handles.axes2);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
hold on
axes(handles.axes2)
hold on

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton1, 'Value', 1);
set(handles.radiobutton2, 'Value', 0);

axes(handles.axes1)
grid on;
axes(handles.axes2)
grid on;



% --- Executes on selection change in lineStylePopMenu.
function lineStylePopMenu_Callback(hObject, eventdata, handles)
% hObject    handle to lineStylePopMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lineStylePopMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lineStylePopMenu


% --- Executes during object creation, after setting all properties.
function lineStylePopMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lineStylePopMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in colorLinePopMenu.
function colorLinePopMenu_Callback(hObject, eventdata, handles)
% hObject    handle to colorLinePopMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns colorLinePopMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from colorLinePopMenu


% --- Executes during object creation, after setting all properties.
function colorLinePopMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colorLinePopMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ivEdit_Callback(hObject, eventdata, handles)
% hObject    handle to ivEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ivEdit as text
%        str2double(get(hObject,'String')) returns contents of ivEdit as a double


% --- Executes during object creation, after setting all properties.
function ivEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ivEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fvEdit_Callback(hObject, eventdata, handles)
% hObject    handle to fvEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fvEdit as text
%        str2double(get(hObject,'String')) returns contents of fvEdit as a double


% --- Executes during object creation, after setting all properties.
function fvEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fvEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nsEdit_Callback(hObject, eventdata, handles)
% hObject    handle to nsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nsEdit as text
%        str2double(get(hObject,'String')) returns contents of nsEdit as a double


% --- Executes during object creation, after setting all properties.
function nsEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numEdit_Callback(hObject, eventdata, handles)
% hObject    handle to numEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numEdit as text
%        str2double(get(hObject,'String')) returns contents of numEdit as a double


% --- Executes during object creation, after setting all properties.
function numEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function denEdit_Callback(hObject, eventdata, handles)
% hObject    handle to denEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of denEdit as text
%        str2double(get(hObject,'String')) returns contents of denEdit as a double


% --- Executes during object creation, after setting all properties.
function denEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to denEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2

set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 1);

axes(handles.axes1)
grid off;
axes(handles.axes2)
grid off;
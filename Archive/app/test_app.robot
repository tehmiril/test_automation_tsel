*** Settings ***
Library           AppiumLibrary
Resource          Test_data_LINE_Indo.txt
Library           String
Library           Collections
Resource          Object_repo_LINE.txt

*** Test Cases ***
_test_FB
    Open Application    ${appiumServer_FB}    platformName=${platformName_FB}    platformVersion=${androidVersion_FB}    deviceName=${deviceName_FB}    appPackage=${appPackage_FB}    appActivity=${appActivity_FB}
    ...    noReset=true
    Wait Until Element is Visible    //*[@text="MESSAGES"]    10    None
    Log Source
    Click Element    //*[@instance="13"]
    Wait Until Element is Visible    //*[@content-desc="Telkomsel"]    10    None
    Input Text    class=android.widget.EditText    Hi
    Click Element    //*[@content-desc="Send"]
    Wait Until Element is Visible    //*[@text="MESSAGES"]    10    None

_LINE_askPulsaKuota
    [Setup]    Open app
    Wait Until Element is Visible    //*[@content-desc="Chats tab"]    10    None
    Click Element    //*[@content-desc="Chats tab"]
    Wait Until Element is Visible    //*[@text="Chats"]    5    None
    Click Element    id=jp.naver.line.android:id/chatlist_chatname
    #Click Element    //*[@content-desc="Keyboard menu"]
    User_input    ${ask_pulsa}
    Capture Page Screenshot    first_response_pulsa.png
    ${result}    Run Keyword and Return Status    Check_VA_response    ${VA_validateNumber}
    Run Keyword If    ${result}    Click_Yes
    Sleep    10s
    Check_VA_response_main    ${VA_answerPulsa1}
    User_input    ${ask_kuota}
    Check_VA_response_main    ${VA_answerKuota1}
    Click_No
    Sleep    5s
    Check_VA_response_main    ${VA_question_1}
    User_input    ${no_answer}
    Check_VA_response_main    ${VA_question_2}
    User_input    ${user_rate}
    Check_VA_response_main    ${VA_question_3}
    User_input    ${select_Rate}
    Check_VA_response_main    ${VA_askRateReason}
    User_input    ${no_answer}
    Sleep    10s
    Check_VA_response_main    ${VA_thanksRate}
    [Teardown]    Close Application

LINE_askVAdonotunderstand
    [Setup]    Open app
    Wait Until Element is Visible    //*[@content-desc="Chats tab"]    10    None
    Click Element    //*[@content-desc="Chats tab"]
    Wait Until Element is Visible    //*[@text="Chats"]    5    None
    Click Element    id=jp.naver.line.android:id/chatlist_chatname
    #Click Element    //android.widget.RelativeLayout[@index="2"]
    ${count_message}    Get Matching Xpath Count    ${messagebubble_obj}
    ${elements}    Get Webelement    //*[@class="android.widget.TextView" and @text="Terima kasih atas penilaiannya :) Sampai jumpa di chat berikutnya dan semoga harimu menyenangkan ya"]
    ${text_mess}    Get Text    //*[@class="android.widget.TextView"][${count_message}]
    #User_input    ${random_question_1}
    #Sleep    5s
    #Capture Page Screenshot    first_response_notunderstand.png
    #Check_VA_response_main    ${VA_notunderstand_1}
    #User_input    ${random_question_2}
    #Sleep    2s
    #Check_VA_response_main    ${VA_notunderstand_6}
    #User_input    ${cancel_answer}
    #Sleep    2s
    #User_input    ${no_answer}
    #Check_VA_response_main    ${VA_question_2}
    #User_input    ${user_rate}
    #Check_VA_response_main    ${VA_question_3}
    #User_input    ${select_Rate}
    #Check_VA_response_main    ${VA_askRateReason}
    #User_input    ${no_answer}
    #Sleep    5s
    #Check_VA_response_main    ${VA_thanksRate}
    [Teardown]    Close Application

_test_Telegram
    Open Application    ${appiumServer_Tele}    platformName=${platformName_Tele}    platformVersion=${androidVersion_Tele}    deviceName=${deviceName_Tele}    appPackage=${appPackage_Tele}    appActivity=${appActivity_Tele}
    ...    noReset=true
    Wait Until Element is Visible    class=org.telegram.messenger.support.widget.RecyclerView    15    None
    Click Element    //android.view.View[@index="0"]
    Wait Until Element is Visible    class=android.widget.EditText    10    None
    Input Text    class=android.widget.EditText    Hi
    Click Element    //android.widget.ImageView[@index="2"]
    Wait Until Element is Visible    //*[@text="Lihat Menu Utama"]    5    None
    [Teardown]    Close Application

_test_LINE_carousel
    [Setup]    Open app
    Wait Until Element is Visible    //*[@content-desc="Chats tab"]    10    None
    Click Element    //*[@content-desc="Chats tab"]
    Wait Until Element is Visible    //*[@text="Chats"]    5    None
    Click Element    id=jp.naver.line.android:id/chatlist_chatname
    #Click Element    //*[@content-desc="Keyboard menu"]
    Click Element    //*[@text="CEK INFONYA!"]
    Sleep    2s
    ${elementX}    Select_carousel    Bantuan Lainnya
    Run Keyword If    39.0 < ${elementX} < 233.0    Log    "hey"${elementX}
    ...    ELSE    Swipe_until_element    Bantuan Lainnya

*** Keywords ***
Swipe_until_element
    [Arguments]    ${findElement}
    : FOR    ${licznik}    IN RANGE    0    10
    \    Swipe    600    600    100    600
    \    ${elementXNew}    Select_carousel    ${findElement}
    \    Run Keyword If    39.0 < ${elementXNew} < 233.0    Run Keywords    Log    "Yeah"
    \    ...    AND    Exit For Loop
    \    ${licznik}    Set Variable    ${licznik}+1

Select_carousel
    [Arguments]    ${findElement}
    ${bound}    Get Element Location    //android.view.View[@text="${findElement}"]
    ${boundString}    Convert To String    ${bound}
    ${elementsXY}    Split String    ${boundString}    ${SPACE}
    #location format, e.g. ${elementsXY} = [u"{'y':", u'702.0,', u"'x':", u'718.0}']
    ${elementX}    Get From List    ${elementsXY}    3
    ${finalelementX}    Strip String    ${elementX}    characters=}
    [Return]    ${finalelementX}

Open app
    Open Application    ${appiumServer_LINE}    platformName=${platformName_LINE}    platformVersion=${androidVersion_LINE}    deviceName=${deviceName_LINE}    appPackage=${appPackage_LINE}    appActivity=${appActivity_LINE}
    ...    noReset=true

User_input
    [Arguments]    ${input_text}
    Click Element    //*[@content-desc="Keyboard menu"]
    Wait Until Element is Visible    ${textbox_obj}    5    None
    Input Text    ${textbox_obj}    ${input_text}
    Click Element    ${sendkey_obj}
    Sleep    5s
    Click Element    //*[@content-desc="Keyboard menu"]

Check_VA_response
    [Arguments]    ${response_text}
    Click Element    id=jp.naver.line.android:id/chathistory_main_content_area
    Element Should Be Visible    //android.view.View[contains(@text,'${response_text}')]
    #Text Should Be Visible    ${response_text}    False
    #Wait Until Page Contains Element    //android.view.View[@text='${response_text}']    2s

Click_Yes
    ${totalYa}    Get Matching Xpath Count    ${Ya_button}
    Click Element    ${Ya_button}[${totalYa}]

Click_No
    ${totalNo}    Get Matching Xpath Count    ${Tidak_button}
    Click Element    ${Tidak_button}[${totalNo}]

Check_VA_response_main
    [Arguments]    ${response_text}
    Click Element    id=jp.naver.line.android:id/chathistory_main_content_area
    Element Should Be Visible    //android.widget.TextView[contains(@text,'${response_text}')]

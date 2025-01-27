*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          0.3
${FORM URL}      http://${SERVER}/Form.html
${COMPLETE URL}      http://${SERVER}/Complete.html
${CHROME_BROWSER_PATH}    D:/Lab7Test/LAB7/ChromeForTesting/chrome.exe
${CHROME_DRIVER_PATH}    D:/Lab7Test/LAB7/ChromeForTesting/chromedriver.exe
${URL}    https://www.kku.ac.th
${FIRSTNAME}    Somsong
${LASTNAME}    Sandee
${DESTINATION}    Europe
${CONTACT}    Sodsai Sandee
${RELATION}    Mother
${EMAIL}    somsong@kkumail.com
${PHONE}    081-111-1234

*** Keywords ***
Start Chrome For Testing
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    # [selenium >= 4.10] `chrome_options` change to `options`
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}

Open Browser To Form Page
    Start Chrome For Testing
    Go To    ${FORM URL}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Form Page Should Be Open

Form Page Should Be Open
    Location Should Be    ${FORM URL}
    Title Should Be    Customer Inquiry
    Element Should Be Visible    name=myform

Input First Name
    [Arguments]    ${firstname}
    Input Text    firstname    ${firstname}

Input Last Name
    [Arguments]    ${lastname}
    Input Text    lastname    ${lastname}

Input Contact person 
    [Arguments]    ${contactperson}
    Input Text    contactperson    ${contactperson}

Input Destination  
    [Arguments]    ${destination}
    Input Text    destination    ${destination}
    

Input Relationship 
    [Arguments]    ${relationship}
    Input Text    relationship    ${relationship}

Input Email 
    [Arguments]    ${email}
    Input Text    email    ${email}

Input Phone 
    [Arguments]    ${phone}
    Input Text    phone    ${phone}

Submit Button
    Click Button    submitButton

Complete Page Should Be Open
    Location Should Be    ${COMPLETE URL}
    Title Should Be    Completed
    Wait Until Page Contains    Our agent will contact you shortly.
    Wait Until Page Contains    Thank you for your patient.

Please enter your destination
    Location Should Be    ${FORM URL}
    Wait Until Page Contains    Please enter your destination.

Please enter a valid email address
    Location Should Be    ${FORM URL}
    Wait Until Page Contains    Please enter a valid email address.

Please enter a phone number
    Location Should Be    ${FORM URL}
    Wait Until Page Contains    Please enter a phone number.


Please enter a valid phone number
    Location Should Be    ${FORM URL}
    Wait Until Page Contains    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678
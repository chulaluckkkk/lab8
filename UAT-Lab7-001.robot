*** Settings ***
RESOURCE    resource.robot

*** Test Cases ***
TC_001: Open Form
    Open Browser To Form Page

TC_002: Record Success
    Input First Name    ${FIRSTNAME}
    Input Last Name    ${LASTNAME}
    Input Destination    ${DESTINATION}
    Input Contact person    ${CONTACT}
    Input Relationship    ${RELATION} 
    Input Email    ${EMAIL}
    Input Phone    ${PHONE}
    Submit Button 
    Complete Page Should Be Open
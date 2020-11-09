//
//  Constants.swift
//  WFMS
//
//  Created by NectarInfotel2 on 27/02/20.
//  Copyright © 2020 NectarInfotel2. All rights reserved.
//

import UIKit

struct Constants {
    
    static let singleton = Singleton.sharedManager
    
    struct RequestType
    {
        static  let  client_detail           = "client_detail?"
        static  let  login                   = "login?"
        static let   timeIn                  = "attendance/in?"
        static let   timeOut                 = "attendance/out?"
        static let   attendance_status       = "attendance_status?"
        static let   attendance_list         = "attendance/list?"
        static let   attendance_filter       = "attendance_filter?"
        static let   uploadUserImage         = "user_detail"
        static let   logout                  = "user/reset_token?"
        static let   get_piechart_details    = "piechart?"
        static let   get_piechart_User_details    = "user/toadmin_detail?"
        static let   resetPin                = "user/reset?"
        static let   datageofence            = "datageofence?"
        static let   addgeofence             = "addgeofence?"
        static let   updategeofence          = "updategeofence?"
        static let   removegeofence          = "removegeofence?"
        static let   assigngeofence          = "assigngeofence?"
        static let   unassigngeofence        = "unassigngeofence?"
        static let   singlegeonotification   = "singlegeonotification?"
        static let   usergeofence            = "usergeofence?"
        static let   notificationgeo         = "notificationgeo?"
        static let   notificationhistry      = "notificationhistry?"
    }
    
    struct HardcodedData {
        static let monthsArray = ["Jan", "Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"]
        static let yearArray = ["2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030","2031","2032","2033","2034","2035","2036","2037","2038","2039","2040","2041"]
        //screen cgrect details
        static let screenHeight = UIScreen.main.bounds.height
        static let screenWidth = UIScreen.main.bounds.width
        static let timePeriod = 10
    }

    struct HostName
    {
        static let strUATBaseURL      = "http://wfmsuat.timesheet.nectarinfotel.com/"
        static let strPRODBaseURL      = "http://wfmsuat.timesheet.nectarinfotel.com/"
        static let strLocalBaseURL    = "http://192.168.168.73/TFS/wfms_timesheet/public/"
    }
    
    struct HexColors
    {
        static let wfmsBlue = "#49B3CB"
        static let activeColor = "#E70D2D"
        static let wfmsCyan = "#34CBCC"
    }
    
    struct Storyboards {
        static let main = UIStoryboard.init(name: "Main", bundle: .main)
    }
    
    struct UserDefaults {
        static let firstTimeUser = "isUserLogin"
        static let isGuestUser = "isGuestLogin"
        static let rememberMeClicked = "rememberMeClicked"
        static let clientNameStr = "ClientName"
        static let userDetails = "UserDetails"
        static let applanguages = "AppleLanguages"
        static let selectedLanguage = "AppLanguage"
    }
    
    struct validationMesages {
        
        static let emptyOrganization    = "Please enter organization name"
        static let validOrganization    = "Please enter valid organization name"
        static let emptyContactNo       = "Please enter contact number".localised()
        static let validatemobile       = "Please enter valid mobile number".localised()
        static let emptyPassword        = "Please enter password".localised()
        static let unableToConnect      = "Unable To connect to server please try again!".localised()
        static let emptyFullname        = "Please enter fullname".localised()
        static let emptyEmailId         = "Please enter email Id".localised()
        static let validEmailId         = "Please enter valid email Address".localised()
        static let emptyConfPassword    = "Please enter Confirm Password".localised()
        static let passwordMismatch     = "Password & Confirm password should be same!".localised()
        static let mobileNoValidation   = "Mobile number should be start from 91 or 99".localised()
    }
    
    struct Fonts {
        static let  lato_Black = "Lato-Black"
        static let  lato_BlackItalic = "Lato-BlackItalic"
        static let  lato_Bold = "Lato-Bold"
        static let  lato_BoldItalic = "Lato-BoldItalic"
        static let  lato_Hairline = "Lato-Hairline"
        static let lato_HairlineItalic = "Lato-HairlineItalic"
        static let lato_Heavy = "Lato-Heavy"
        static let lato_HeavyItalic = "Lato-HeavyItalic"
        static let lato_Italic = "Lato-Italic"
        static let lato_Light = "Lato-Light"
        static let lato_LightItalic = "Lato-LightItalic"
        static let lato_Medium = "Lato-Medium"
        static let lato_MediumItalic = "Lato-MediumItalic"
        static let lato_Regular = "Lato-Regular"
        static let lato_Semibold = "Lato-Semibold"
        static let lato_SemiboldItalic = "Lato-SemiboldItalic"
        static let lato_Thin = "Lato-Thin"
        static let lato_ThinItalic = "Lato-ThinItalic"
    }
}

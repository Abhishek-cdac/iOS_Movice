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
        static let monthsArray = ["January", "February","March","April","May","June","July","August","September","October","November","December"]
        static let yearArray = ["2019","2020"]
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
        static let activeColor = "#333366"
        static let wfmsCyan = "#34CBCC"
    }
    
    struct Storyboards {
        static let main = UIStoryboard.init(name: "Main", bundle: .main)
    }
    
    struct UserDefaults {
        static let firstTimeUser = "isUserLogin"
        static let rememberMeClicked = "rememberMeClicked"
        static let clientNameStr = "ClientName"
        static let userDetails = "UserDetails"
    }
    
    struct validationMesages {
        
        static let emptyOrgnizationName = "Please enter orgnization name"
        static let emptyUsername        = "Please enter email id"
        static let validateEmailid      = "Please enter valid email id"
        static let emptypassword        = "Please enter password"

        static let emptyClientName           = "The clientname field is required."
        static let tryAgainError             = "Please try again"
        static let unableToConnect           = "Unable to connect to server"
        
        static let biometricAuthErrorMsg     = "You could not be verified; please try again!"
        static let biometricAuthErrorTitle   = "Authentication failed!"
        
        static let emptyRecords              = "No Records Found!"
        static let uploadImageSuccess        = "Image uploaded successfully"
        static let emptyUserSelection        = "Please select User"
        static let emptyYearSelection        = "Please select Year"
        static let emptyMonthSelection       = "Please select Month"
        static let emptyOldpassword          = "Please enter old password"
        static let emptyNewPassword          = "Please enter new password"
        static let emptyConfirmPassword      = "Please enter confirmed password"
        static let passwordMismatch          = "New password & Confirm password does not match"
        
        //Add Geofence Screen
        static let emptyGeofenceName         = "Plase enter geofence name"
        static let emptyGeofenceType         = "Please select geofence type"
        static let emptyGeofenceAddrs        = "Please enter geofence address"
        static let emptyLattitude            = "Please enter Latitude"
        static let emptyLongitude            = "Please enter Longitute"
        static let emptyRadius               = "Please enter Radius"
        static let emptyDestGeofenceAddrs    = "Please enter destination geofence address"
        static let emptyDestLatitude         = "Please enter destination Latitude"
        static let emptyDestLongitute        = "Please enter destination Longitude"
        static let userAuthorizationError    = "User is not authorized."
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

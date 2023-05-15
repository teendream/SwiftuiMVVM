//
//  SettingProvider.swift
//  InterviewApp
//
//  Created by Azizbek Abdulkhakimov on 10/05/23.
//

import Foundation

struct SettingProvider {

    private static let cloudImageSize =
    FirebaseSetting(AppPrefs.IMAGE_SIZE_KEY,
                    CloudAppPrefs.imageSize().getObjectValue(),
                    { value in CloudAppPrefs.imageSize().setValue(value as! Int) })
    private static let cloudDecimalCount =
    FirebaseSetting(AppPrefs.DECIMAL_COUNT_KEY,
                    AppPrefs.decimalCount().getObjectValue(),
                    { value in AppPrefs.decimalCount().setValue(value as! Int) })

 
    private static let cloudContrasNameExcelColumn =
    FirebaseSetting(AppPrefs.CONTRAS_NAME_EXCEL_COLUMN,
                    AppPrefs.ExcelColumns.contrasNameExcelColumn().getObjectValue(),
                    { value in AppPrefs.ExcelColumns.contrasNameExcelColumn().setValue(value as! String) })
    private static let cloudContrasAddressExcelColumn =
    FirebaseSetting(AppPrefs.CONTRAS_ADDRESS_EXCEL_COLUMN,
                    AppPrefs.ExcelColumns.contrasAddressExcelColumn().getObjectValue(),
                    { value in AppPrefs.ExcelColumns.contrasAddressExcelColumn().setValue(value as! String) })
    
    private static let cloudOrgName =
    FirebaseSetting(AppPrefs.ORG_NAME,
                    AppPrefs.orgName().getObjectValue(),
                    { value in AppPrefs.orgName().setValue(value as! String) })
    private static let cloudOrgInn =
    FirebaseSetting(AppPrefs.ORG_INN,
                    AppPrefs.orgInn().getObjectValue(),
                    { value in AppPrefs.orgInn().setValue(value as! String) })

    func getCloudShowDocHeader() -> FirebaseSetting {
        return Self.cloudShowDocHeader
    }

    private static let cloudShowCrop =
    FirebaseSetting(AppPrefs.SHOW_CROP_KEY,
                    AppPrefs.showCrop().getObjectValue(),
                    { value in AppPrefs.showCrop().setValue(value as! Bool) })
    private static let cloudShowDocHeader =
    FirebaseSetting(AppPrefs.SHOW_DOC_HEADER_KEY,
                    AppPrefs.showDocHeader().getObjectValue(),
                    { value in AppPrefs.showDocHeader().setValue(value as! Bool) })

    ...

    private static let cloudInnerColor =
    FirebaseSetting(AppPrefs.INNER_DOC_COLORS_KEY,
                    AppPrefs.innerColor().getObjectValue(),
                    { value in AppPrefs.innerColor().setValue(value as! Int) })
    private static let cloudOuterColor =
    FirebaseSetting(AppPrefs.OUTER_DOC_COLORS_KEY,
                    AppPrefs.outerColor().getObjectValue(),
                    { value in AppPrefs.outerColor().setValue(value as! Int) })

    ...

    public static func getWriteTransactionsToFile() -> FirebaseSetting {
        return writeTransactionsToFile
    }

    public static func getCloudCheckMinQuantityInterval() -> FirebaseSetting {
        return cloudCheckMinQuantityInterval
    }

    public static func getCloudContrasNameExcelColumn() -> FirebaseSetting {
        return cloudContrasNameExcelColumn
    }

    public static func getCloudContrasAddressExcelColumn() -> FirebaseSetting {
        return cloudContrasAddressExcelColumn
    }

    ...

}

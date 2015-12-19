//
//  AppConstants.h
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/18/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#ifndef AppConstants_h
#define AppConstants_h

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define FontName @"Helvetica"
#define BoldFontName @"Helvetica-Bold"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define APP_THEME_COLOUR UIColorFromRGB(0xe9e9e9)
#define UIAppThemeFontColor UIColorFromRGB(0x404040)
#define UIAppThemeLightGreyColor UIColorFromRGB(0xC1C3C7)
#define UIAppThemeGreyColor UIColorFromRGB(0xe7e7e7)


#endif /* AppConstants_h */

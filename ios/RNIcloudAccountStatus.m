@import CloudKit;

#import "RNIcloudAccountStatus.h"

static NSString* const STATUS_COULD_NOT_DETERMINE = @"couldNotDetermine";
static NSString* const STATUS_AVAILABLE = @"available";
static NSString* const STATUS_RESTRICTED = @"restricted";
static NSString* const STATUS_NO_ACCOUNT = @"noAccount";

@implementation RNIcloudAccountStatus

RCT_EXPORT_MODULE();

RCT_REMAP_METHOD(getStatus,
                 getStatusWithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    [[CKContainer defaultContainer] accountStatusWithCompletionHandler:^(CKAccountStatus accountStatus, NSError *error) {
        if (error != nil) {
            reject(@"account_status_error", @"Error getting iCloud account status", error);
        } else {
            switch (accountStatus) {
                case CKAccountStatusCouldNotDetermine:
                    resolve(STATUS_COULD_NOT_DETERMINE);
                    break;
                case CKAccountStatusAvailable:
                    resolve(STATUS_AVAILABLE);
                    break;
                case CKAccountStatusRestricted:
                    resolve(STATUS_RESTRICTED);
                    break;
                case CKAccountStatusNoAccount:
                    resolve(STATUS_NO_ACCOUNT);
                    break;
                default:
                    resolve(STATUS_COULD_NOT_DETERMINE);
            }
        }
    }];
}

- (NSDictionary *)constantsToExport
{
    return @{ @"STATUS_COULD_NOT_DETERMINE" : STATUS_COULD_NOT_DETERMINE,
              @"STATUS_AVAILABLE" : STATUS_AVAILABLE,
              @"STATUS_RESTRICTED" : STATUS_RESTRICTED,
              @"STATUS_NO_ACCOUNT" : STATUS_NO_ACCOUNT };
};

@end


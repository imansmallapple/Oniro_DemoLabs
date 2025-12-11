   import { geoLocationManager } from '@kit.LocationKit';
import { abilityAccessCtrl, common, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { CoordinateType, toDMS } from '../common/CoordinatesConverter';

@Entry
@Component
struct Index {
  private atManager: abilityAccessCtrl.AtManager | null = null
  private context: common.UIAbilityContext | undefined = undefined

  isLocationSettingOpen() {
    return geoLocationManager.isLocationEnabled();
  }

  aboutToAppear(): void {
    try {
      this.context = this.getUIContext().getHostContext() as common.UIAbilityContext
    } catch {
      this.context = undefined
    }
    this.atManager = abilityAccessCtrl.createAtManager()
    this.requestPermissionsAndStart()

    if (!this.isLocationSettingOpen()) {
      this.requestLocation()
    }
  }

  async requestPermissionsAndStart(): Promise<void> {
    const perms: Permissions[] = ['ohos.permission.LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION']
    try {
      if (this.atManager && this.context) {
        const result = await this.atManager.requestPermissionsFromUser(this.context, perms)
        console.log('Permission request result: ' + JSON.stringify(result))
      }
    } catch (err) {
      console.error('Request permission failed: ' + JSON.stringify(err))
    }
  }

  getLocationInfo() {
    let request: geoLocationManager.SingleLocationRequest = {
      'locatingPriority': geoLocationManager.LocatingPriority.PRIORITY_LOCATING_SPEED,
      'locatingTimeoutMs': 10000
    }
    try {
      geoLocationManager.getCurrentLocation(request).then((result) => {
        console.log('current location: ' + JSON.stringify(result));

        console.log('current location translated: ' + toDMS(result.latitude, CoordinateType.LATITUDE) + ", "
          + toDMS(result.longitude, CoordinateType.LONGITUDE));
      })
        .catch((error: BusinessError) => {
          console.error('promise, getCurrentLocation: error=' + JSON.stringify(error));
        });
    } catch (err) {
      console.error("errCode:" + JSON.stringify(err));
    }
  }

  requestLocation() {
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    let context: Context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    atManager.requestGlobalSwitch(context, abilityAccessCtrl.SwitchType.LOCATION).then((data: Boolean) => {
      console.info(`requestGlobalSwitch success, result: ${data}`);
    }).catch((err: BusinessError) => {
      console.error(`requestGlobalSwitch fail, code: ${err.code}, message: ${err.message}`);
    });
  }

  build() {
    Column() {
      Button('Get')
        .onClick(() => {
          this.getLocationInfo()
        })
    }
    .height('100%')
    .width('100%')
  }
}
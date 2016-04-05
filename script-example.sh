API_KEY="you-api-key"
APP_ID="your-app-id" #example: 1
PASSWORD="your-password"
AVAILABILITY="10_minutes" #10_minutes, 1_hour, 3_hours, 6_hours, 12_hours, 24_hours, forever
TMP_FILE_PATH="/tmp/${PRODUCT_NAME}.ipa"

GROWL="${HOME}/bin/growlnotify -a Xcode -w"

echo "Creating .ipa for ${PRODUCT_NAME}" | ${GROWL}
xcrun -sdk iphoneos PackageApplication "$ARCHIVE_PRODUCTS_PATH/$INSTALL_PATH/$WRAPPER_NAME" -o "${TMP_FILE_PATH}"
echo "Created .ipa for ${PRODUCT_NAME}" | ${GROWL}


echo "Uploading .ipa to RivieraBuild" | ${GROWL}
OUTPUT=$(/usr/bin/curl "https://apps.rivierabuild.com/api/upload" -F api_key="${API_KEY}" -F app_id="${APP_ID}" -F file=@"${TMP_FILE_PATH}" -F availability="${AVAILABILITY}" -F passcode="${PASSWORD}") #the password parametre is optional here
URL=$(echo $OUTPUT | python -m json.tool | sed -n -e '/"file_url":/ s/^.*"\(.*\)".*/\1/p')
echo "Uploaded .ipa to RivieraBuild" | ${GROWL}

echo $URL | pbcopy
osascript -e 'display notification "Copied to clipboard: '$URL'" with title "Riviera Build"'
open $URL

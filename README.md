# react-native-plist

## Getting started

`$ npm install react-native-plist --save`

### Mostly automatic installation

`$ react-native link react-native-plist`

## Usage
```javascript
import Plist from 'react-native-plist';

// Make use of the below functions to create, read and write data from plist in iOS app bundle

// To create plist
// Params - NAME: Sample.plist
Plist.createPlist('Sample.plist')
    .then(path => {
      console.log('PATH', path);
    })
    .catch(e => {
      console.log('ERROR', e);
    });

// To read from plist
// Params - NAME: Sample.plist, KEY: key 1
Plist.getDataFromPlist('Sample.plist', 'key 1')
    .then(value => {
      console.log('Value', value);
    })
    .catch(e => console.log('ERROR', e));

// To update values in plist
// Params - NAME: Sample.plist, KEY: key 1, VALUE: Value 1
Plist.updatePlistWithString('Sample.plist', 'key 1', 'Value 1')
    .then(path => {
      console.log('PATH', path);
    })
    .catch(e => console.log('ERROR', e));

// Similar functions to update plist with different data types

Plist.updatePlistWithNumber('Sample.plist', 'key 2', 5)
Plist.updatePlistWithBool('Sample.plist', 'key 3', true)
Plist.updatePlistWithDate(
    'Sample.plist',
    'key 4',
    '2015-04-01T11:42:00.269Z',
  )
Plist.updatePlistWithArray('Sample.plist', 'key 5', ['Benz', 'Volvo', 'BMW'])  
Plist.updatePlistWithDictionary('Sample.plist', 'key 6', {
    fruit1: 'Apple',
    fruit2: 'Orange',
  })
Plist.updatePlistWithData(
    'Sample.plist',
    'key 7',
    '0cd9f571b0e66e6dca410d12f67a404a7e64b9b5d2483fd963a9267b1c7609e2',
  )

// NOTE: The path of the plist can be retrieved as response on the successful operation

```

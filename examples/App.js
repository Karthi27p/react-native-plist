import React from 'react';
import {SafeAreaView, Button, StatusBar} from 'react-native';
import Plist from 'react-native-plist';

const App: () => React$Node = () => {
  return (
    <>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView>
        <Button onPress={createPlist} title="CREATE PLIST" />
        <Button
          onPress={updatePlistWithString}
          title="UPDATE PLIST WITH STRING"
        />
        <Button
          onPress={updatePlistWithNumber}
          title="UPDATE PLIST WITH NUMBER"
        />
        <Button onPress={updatePlistWithBool} title="UPDATE PLIST WITH BOOL" />
        <Button onPress={updatePlistWithDate} title="UPDATE PLIST WITH DATE" />
        <Button
          onPress={updatePlistWithArray}
          title="UPDATE PLIST WITH ARRAY"
        />
        <Button
          onPress={updatePlistWithDictionary}
          title="UPDATE PLIST WITH DICTIONARY"
        />
        <Button onPress={updatePlistWithData} title="UPDATE PLIST WITH DATA" />
        <Button onPress={readFromPlist} title="READ PLIST" />
        <Button onPress={getVersionNumber} title="GET VERSION NUMBER" />
      </SafeAreaView>
    </>
  );
};

const createPlist = () => {
  console.log('CALLEd');
  Plist.createPlist('Sample.plist')
    .then(path => {
      console.log('PATH', path);
    })
    .catch(e => {
      console.log('ERROR', e);
    });
};

const readFromPlist = () => {
  Plist.getDataFromPlist('Sample.plist', 'test 1')
    .then(value => {
      console.log('Value', value);
    })
    .catch(e => console.log('ERROR', e));
};

const updatePlistWithString = () => {
  Plist.updatePlistWithString('Sample.plist', 'test 1', 'TEST VALUE')
    .then(path => {
      console.log('PATH', path);
    })
    .catch(e => console.log('ERROR', e));
};

const updatePlistWithNumber = () => {
  Plist.updatePlistWithNumber('Sample.plist', 'test 2', 5)
    .then(path => {
      console.log('PATH', path);
    })
    .catch(e => console.log('ERROR', e));
};

const updatePlistWithBool = () => {
  Plist.updatePlistWithBool('Sample.plist', 'test 3', true)
    .then(path => {
      console.log('PATH', path);
    })
    .catch(e => console.log('ERROR', e));
};

const updatePlistWithDate = () => {
  Plist.updatePlistWithDate(
    'Sample.plist',
    'test 4',
    '2015-04-01T11:42:00.269Z',
  )
    .then(path => {
      console.log('PATH', path);
    })
    .catch(e => console.log('ERROR', e));
};

const updatePlistWithArray = () => {
  Plist.updatePlistWithArray('Sample.plist', 'test 5', ['Benz', 'Volvo', 'BMW'])
    .then(path => {
      console.log('PATH', path);
    })
    .catch(e => console.log('ERROR', e));
};

const updatePlistWithDictionary = () => {
  Plist.updatePlistWithDictionary('Sample.plist', 'test 6', {
    key1: 'Hi',
    key2: 'Hello',
  })
    .then(path => {
      console.log('PATH', path);
    })
    .catch(e => console.log('ERROR', e));
};

const updatePlistWithData = () => {
  Plist.updatePlistWithData(
    'Sample.plist',
    'test 7',
    '0cd9f571b0e66e6dca410d12f67a404a7e64b9b5d2483fd963a9267b1c7609e2',
  )
    .then(path => {
      console.log('PATH', path);
    })
    .catch(e => {
      console.log('ERROR', e);
    });
};

const getVersionNumber = () => {
  Plist.getDataFromPlist('Info.plist', 'CFBundleShortVersionString')
    .then(value => {
      console.log('Value', value);
    })
    .catch(e => console.log('ERROR', e));
};

export default App;

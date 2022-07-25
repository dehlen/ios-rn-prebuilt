import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';


const isHermes = () => !!global.HermesInternal;
const WelcomeScreen = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>
        Hermes enabled: {isHermes() ? "true" : "false"}
      </Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF'
  },
  title: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10
  },
});

AppRegistry.registerComponent('WelcomeScreen', () => WelcomeScreen);
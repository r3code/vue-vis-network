# vue-vis-network

***!!! NOTE !!! Hi developer. Please contribute to the project if you find a bug or suggest an improvement / feature. Because I’m very, very busy these days, and it won’t end in the next 2-4 months. Hope you can do it faster than me )***

> Vue2 component to integrate with <a href="Vue2 component to integrate with vis-network">Vis-Network</a> views

<p align="center">
  <a href="https://travis-ci.org/r3code/vue-vis-network">
    <img src="https://travis-ci.org/r3code/vue-vis-network.svg?branch=master" alt="Build Status" />
  </a>
  <a href="https://coveralls.io/github/r3code/vue-vis-network?branch=master">
    <img src="https://coveralls.io/repos/github/r3code/vue-vis-network/badge.svg?branch=master" alt="Coverage Status" />
  </a>
  <a href="LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg?" alt="Software License" />
  </a>
  <a href="https://npmjs.org/package/vue-vis-network">
    <img src="https://img.shields.io/npm/v/vue-vis-network.svg?" alt="Packagist" />
  </a>
  <a href="https://github.com/r3code/vue-vis-network/releases">
    <img src="https://img.shields.io/github/release/r3code/vue-vis-network.svg?" alt="Latest Version" />
  </a>

  <a href="https://github.com/r3code/vue-vis-network/issues">
    <img src="https://img.shields.io/github/issues/r3code/vue-vis-network.svg?" alt="Issues" />
  </a>  
</p> 

Best reagrds to the https://github.com/alexcode/vue2vis which is the base for this component. This project might have some issues from https://github.com/alexcode/vue2vis

### Installation
```
npm install --save vis-util vis-data vis-network vue-vis-network
```

or

```
yarn add vis-util vis-data vis-network vue-vis-network
```

## Usage

Declare the component
``` javascript
import { Network } from "vue-vis-network";
Vue.component('network', Network);
```

Add the component in the template.

```html
<body>
  <div id="app">
    <network ref="network"
    :nodes="nodes"
    :edges="edges"
    :options="options">
    </network>
  </div>
</body>
```

Add groups, items and options in your observed data or computed.
``` javascript
new Vue({
  el: '#app',
  data() {
    return {
      nodes: [
        {id: 1,  label: 'circle',  shape: 'circle' },
        {id: 2,  label: 'ellipse', shape: 'ellipse'},
        {id: 3,  label: 'database',shape: 'database'},
        {id: 4,  label: 'box',     shape: 'box'    },
        {id: 5,  label: 'diamond', shape: 'diamond'},
        {id: 6,  label: 'dot',     shape: 'dot'},
        {id: 7,  label: 'square',  shape: 'square'},
        {id: 8,  label: 'triangle',shape: 'triangle'},
      ],
      edges: [
        {from: 1, to: 2},
        {from: 2, to: 3},
        {from: 2, to: 4},
        {from: 2, to: 5}, 
        {from: 5, to: 6},
        {from: 5, to: 7},
        {from: 6, to: 8}
      ],
      options: {
         nodes: {
          borderWidth: 4
         },
         edges: {
          color: 'lightgray'
        }
      }
    }
  },
});
```

Add Visjs CSS
``` css
import "vue-vis-network/node_modules/vis-network/dist/vis-network.css";
```

Here is a [basic working demo](https://codepen.io/r3code/pen/abOjJbQ)

## Events

### Component Events
By default all Vis-network events are emitted by your component. You can subscribe to a subset by passing an array in the prop `events` [Vis-network event](https://visjs.github.io/vis-network/docs/network/#Events).

```html
<body>
  <div id="app">
    <network ref="network"
    :nodes="nodes"
    :edges="edges"
    :options="options"
    :events="['selectNode', 'hoverNode']"
    @selectNode="onNodeSelected"
    @hoverNode="onNodeHovered">
    </network>
  </div>
</body>
```

### Data Events

When you pass an Array of data object, it is converted internally as a DataSet.
An event with the DataSet object will be fired at mounted. It's name will be prepend with the prop name (Ex: `items-mounted`, `groups-mounted`). You could use it to interact with the DataSet.

All the [Visjs DataSet event](https://visjs.github.io/vis-data/data/dataset.html#Events) will be prepened the same fashion (`items-add`, `items-remove`, `items-update`). For example, pushing a new object to the `items` prop will fire a `items-add` event with the following payload:
```javascript
{
  event: 'add',
  properties: {
    items: [7],
  },
  senderId: null,
}
```

#### Advanced

You can also manage your own data bindings by passing your own DataSet or DataView instead of an Array.

``` javascript
import { DataSet } from 'vue-vis-network';

new Vue({
  el: '#app',
  data() {
    return {
      nodes: new DataSet([
        {id: 1,  label: 'circle',  shape: 'circle' },
        {id: 2,  label: 'ellipse', shape: 'ellipse'},
        {id: 3,  label: 'database',shape: 'database'}
      ]),
      edges: new DataSet([
        {from: 1, to: 2},
        {from: 1, to: 3}
      ]),
      options: {
        nodes: {
          borderWidth: 4
         }
      }
    }
  },
});
```

## Vis-network documentation

For the full reference see: 
* [Network](https://visjs.github.io/vis-network/docs/network/)
* [DataSet](https://visjs.github.io/vis-data/data/dataset.html)
* [DataView](https://visjs.github.io/vis-data/data/dataview.html)

## Change log

Please see [CHANGELOG](CHANGELOG.md) for more information what has changed recently.

## Testing

``` bash
$ npm run test
```

## Contributing
Please see [CONTRIBUTING](CONTRIBUTING.md) and [CONDUCT](CONDUCT.md) for details.

### Build Setup

``` bash
# Once you have cloned this repo, install dependencies
$ npm install

# Build for development and production with minification
$ npm run build

```
**Build for production**
```
# Linux
NODE_ENV=production npm run build
# Windows
set NODE_ENV=production && npm run build
# Prepare for NPM
set NODE_ENV=production && npm run build:bundle

```

### Run demo locally  

``` bash
# install vue-vis-network local module  
cd ..  
npm link       
# prepare example
cd example
# install the example dependencies
npm install 
# add local vue-vis-network module to node_modules
npm link vue-vis-network
# run demo server
npm run serve
```
Go to <http://localhost:8080/> to see running examples

NOTE: If you make changes to the library you should run `npm run build` again in the root folder.
The dev server should detect modification and reload the demo

## Security

If you discover any security related issues, please email contact@r3code.ru instead of using the issue tracker.

## Credits

- [Dmitriy S. Sinyavskiy][link-author] 
- [Alex Couturon](https://github.com/alexcode)
- [All Contributors][link-contributors]

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.

[link-author]: https://github.com/r3code
[link-contributors]: ../../contributors

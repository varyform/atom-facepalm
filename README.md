# atom-facepalm package

Atom does not like your code. Try harder!

![Screenshot](https://raw.github.com/varyform/atom-facepalm/master/screenshot/atom-facepalm.png)

## Configuration

Out of the box, Atom will consider *all* of your code facepalm-worthy. However, by changing a setting, you can make Atom
only facepalm when it's *really* bad.

If you specify one or more "Activation Events", each time one of the named events is emitted, the facepalm will be
invoked. Similarly, when one of the "Deactivation Events" is received, the facepalm will go away. For example, to
facepalm when your tests are failing, install [Tom Bell's excellent test-status
package](https://atom.io/packages/test-status), and specify the following settings for Facepalm:

 * **Activation Events:** `test-status:fail`
 * **Deactivation Events:** `test-status:success`

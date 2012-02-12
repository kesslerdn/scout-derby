package scout.derby



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.GroovyPageUnitTestMixin} for usage instructions
 */
@TestFor(OrdinalFormatTagLib)
class OrdinalFormatTagLibTests {

    void testOrdinalFormat() {
		assertEquals '1st', applyTemplate('<g:ordinalFormat value="1"/>')
		assertEquals '2nd', applyTemplate('<g:ordinalFormat value="2"/>')
		assertEquals '3rd', applyTemplate('<g:ordinalFormat value="3"/>')
		assertEquals '4th', applyTemplate('<g:ordinalFormat value="4"/>')
		assertEquals '5th', applyTemplate('<g:ordinalFormat value="5"/>')
		
		assertEquals '10th', applyTemplate('<g:ordinalFormat value="10"/>')
		assertEquals '11th', applyTemplate('<g:ordinalFormat value="11"/>')
		assertEquals '12th', applyTemplate('<g:ordinalFormat value="12"/>')
		assertEquals '13th', applyTemplate('<g:ordinalFormat value="13"/>')
		assertEquals '14th', applyTemplate('<g:ordinalFormat value="14"/>')
		assertEquals '15th', applyTemplate('<g:ordinalFormat value="15"/>')
		
		assertEquals '20th', applyTemplate('<g:ordinalFormat value="20"/>')
		assertEquals '21st', applyTemplate('<g:ordinalFormat value="21"/>')
		assertEquals '22nd', applyTemplate('<g:ordinalFormat value="22"/>')
		assertEquals '23rd', applyTemplate('<g:ordinalFormat value="23"/>')
		assertEquals '24th', applyTemplate('<g:ordinalFormat value="24"/>')
		assertEquals '25th', applyTemplate('<g:ordinalFormat value="25"/>')
		
		assertEquals '101st', applyTemplate('<g:ordinalFormat value="101"/>')
		assertEquals '102nd', applyTemplate('<g:ordinalFormat value="102"/>')
		assertEquals '103rd', applyTemplate('<g:ordinalFormat value="103"/>')
		assertEquals '104th', applyTemplate('<g:ordinalFormat value="104"/>')
		assertEquals '105th', applyTemplate('<g:ordinalFormat value="105"/>')
		
		assertEquals '110th', applyTemplate('<g:ordinalFormat value="110"/>')
		assertEquals '111th', applyTemplate('<g:ordinalFormat value="111"/>')
		assertEquals '112th', applyTemplate('<g:ordinalFormat value="112"/>')
		assertEquals '113th', applyTemplate('<g:ordinalFormat value="113"/>')
		assertEquals '114th', applyTemplate('<g:ordinalFormat value="114"/>')
		assertEquals '115th', applyTemplate('<g:ordinalFormat value="115"/>')
		
		assertEquals '120th', applyTemplate('<g:ordinalFormat value="120"/>')
		assertEquals '121st', applyTemplate('<g:ordinalFormat value="121"/>')
		assertEquals '122nd', applyTemplate('<g:ordinalFormat value="122"/>')
		assertEquals '123rd', applyTemplate('<g:ordinalFormat value="123"/>')
		assertEquals '124th', applyTemplate('<g:ordinalFormat value="124"/>')
		assertEquals '125th', applyTemplate('<g:ordinalFormat value="125"/>')
    }
}

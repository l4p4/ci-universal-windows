using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;

namespace Tests
{
    [TestFixture]
    class SharedTest
    {
        [Test]
        public void TestMethod1()
        {
            Assert.AreEqual(2, 2);
        }

        [Test, Ignore]
        public void TestMethod2()
        {
            Assert.AreEqual(2, 3);
        }

        [Test]
        public void TestMethod3()
        {
            string value = "value";

            Assert.IsNotEmpty(value);
        }

        [Test]
        public void TestMethod4()
        {
            Assert.IsNull(null);
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tests.Model
{
    using CIUniversalWindows.Model;
    using NUnit.Framework;

    [TestFixture]
    public class UserTest
    {
        public const string USER_NAME = "Helmat San";

        private User user;

        [SetUp]
        public void Init()
        {
            user = new User();
            user.Name = UserTest.USER_NAME;
            user.Age = DateTime.Now;
        }

        [Test]
        public void CreateEntity()
        {
            Assert.IsNotNull(user);
        }

        [Test]
        public void NameIsNotNull()
        {
            Assert.IsNotNull(user.Name);
        }

        [Test]
        public void AgeIsNotNull()
        {
            Assert.IsNotNull(user.Age);
        }

        [Test]
        public void ToStringIsValid()
        {
            Assert.AreEqual(user.ToString(), String.Format("My name is {0}.", UserTest.USER_NAME));
        }

        [Test]
        public void IsMyNameDefinition()
        {
            Assert.AreEqual(user.Name, UserTest.USER_NAME);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PrjPropertyRentalManagementWebSite.Models;

namespace PrjPropertyRentalManagementWebSite.Controllers
{
    public class TenentController : Controller
    {
        private PropertyRentalManagementWebSiteDBEntities db = new PropertyRentalManagementWebSiteDBEntities();

        // GET: Tenent
        public ActionResult Index()
        {
            
            return View();
        }

        public ActionResult ListOfTenent()
        {
            var tenents = db.Tenents.Include(t => t.User);
            return View(tenents.ToList());
        }

        // GET: Tenent/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tenent tenent = db.Tenents.Find(id);
            if (tenent == null)
            {
                return HttpNotFound();
            }
            return View(tenent);
        }

        // GET: Tenent/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UseName");
            return View();
        }

        // POST: Tenent/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TenentID,UserID,FirstName,LastName,PhoneNumber,Messages")] Tenent tenent)
        {
            if (ModelState.IsValid)
            {
                db.Tenents.Add(tenent);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.Users, "UserID", "UseName", tenent.UserID);
            return View(tenent);
        }

        // GET: Tenent/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tenent tenent = db.Tenents.Find(id);
            if (tenent == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UseName", tenent.UserID);
            return View(tenent);
        }

        // POST: Tenent/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TenentID,UserID,FirstName,LastName,PhoneNumber,Messages")] Tenent tenent)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tenent).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UseName", tenent.UserID);
            return View(tenent);
        }

        // GET: Tenent/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tenent tenent = db.Tenents.Find(id);
            if (tenent == null)
            {
                return HttpNotFound();
            }
            return View(tenent);
        }

        // POST: Tenent/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Tenent tenent = db.Tenents.Find(id);
            db.Tenents.Remove(tenent);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

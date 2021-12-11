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
    public class AppointmentsController : Controller
    {
        private PropertyRentalManagementWebSiteDBEntities db = new PropertyRentalManagementWebSiteDBEntities();

        // GET: Appointments
        public ActionResult Index()
        {
            var appointments = db.Appointments.Include(a => a.Manager).Include(a => a.Schedule);
            return View(appointments.ToList());
        }

        public ActionResult IndividualAppointment()
        {
            var userModel = new PrjPropertyRentalManagementWebSite.Models.Appointment();
            var SS = Session["userName"].ToString();
            var userDetails = db.Appointments.Where(x => x.Username == SS).FirstOrDefault();
            if (userDetails == null)
            {

                Response.Write("<script>alert('You have no new Appointment! ')</script>");
                ViewBag.Message = "Message Sent";
                return View();

            }
            else
            {
                return View(db.Appointments.Where(x => x.Username == SS).ToList());
            }
        }

        // GET: Appointments/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Appointment appointment = db.Appointments.Find(id);
            if (appointment == null)
            {
                return HttpNotFound();
            }
            return View(appointment);
        }

        // GET: Appointments/Create
        public ActionResult Create()
        {
            ViewBag.ManagerID = new SelectList(db.Managers, "ManagerID", "UserID");
            ViewBag.ScheduleID = new SelectList(db.Schedules, "ScheduleID", "DayOfTheWeek");
            return View();
        }

        // POST: Appointments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AppointmentID,AppointmentDate,Status,ScheduleID,ManagerID,Username")] Appointment appointment)
        {
            if (ModelState.IsValid)
            {
                db.Appointments.Add(appointment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ManagerID = new SelectList(db.Managers, "ManagerID", "UserID", appointment.ManagerID);
            ViewBag.ScheduleID = new SelectList(db.Schedules, "ScheduleID", "DayOfTheWeek", appointment.ScheduleID);
            return View(appointment);
        }

        // GET: Appointments/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Appointment appointment = db.Appointments.Find(id);
            if (appointment == null)
            {
                return HttpNotFound();
            }
            ViewBag.ManagerID = new SelectList(db.Managers, "ManagerID", "UserID", appointment.ManagerID);
            ViewBag.ScheduleID = new SelectList(db.Schedules, "ScheduleID", "DayOfTheWeek", appointment.ScheduleID);
            return View(appointment);
        }

        // POST: Appointments/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AppointmentID,AppointmentDate,Status,ScheduleID,ManagerID,Username")] Appointment appointment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(appointment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ManagerID = new SelectList(db.Managers, "ManagerID", "UserID", appointment.ManagerID);
            ViewBag.ScheduleID = new SelectList(db.Schedules, "ScheduleID", "DayOfTheWeek", appointment.ScheduleID);
            return View(appointment);
        }

        // GET: Appointments/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Appointment appointment = db.Appointments.Find(id);
            if (appointment == null)
            {
                return HttpNotFound();
            }
            return View(appointment);
        }

        // POST: Appointments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Appointment appointment = db.Appointments.Find(id);
            db.Appointments.Remove(appointment);
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
